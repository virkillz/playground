defmodule PlaygroundWeb.PlayLive do
  use PlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)

    board = %{
      blue_time: 1000,
      red_time: 1000,
      legal_moves: [],
      legal_attack: [],
      move_turn: :blue,
      select: nil,
      mode: :select_warrior,
      logs: [],
      positions: [
        %{
          id: 1,
          pos_x: 1,
          pos_y: 3,
          name: "Donn",
          team: "blue",
          health: 100,
          luck: 10,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: true,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 2,
          pos_x: 1,
          pos_y: 4,
          name: "Clive",
          team: "blue",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: true,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 3,
          pos_x: 1,
          pos_y: 5,
          name: "Rusko",
          team: "blue",
          health: 100,
          luck: 20,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: true,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 4,
          pos_x: 2,
          pos_y: 3,
          name: "Deanne",
          team: "blue",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: true,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 5,
          pos_x: 2,
          pos_y: 5,
          name: "Ardor",
          team: "blue",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: true,
          attack: 5,
          move_range: 4,
          attack_range: 3
        },
        %{
          id: 6,
          pos_x: 9,
          pos_y: 1,
          name: "Jay",
          team: "red",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 5,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: false,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 7,
          pos_x: 9,
          pos_y: 2,
          name: "Hans",
          team: "red",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: false,
          attack: 5,
          move_range: 3,
          attack_range: 1
        },
        %{
          id: 8,
          pos_x: 10,
          pos_y: 3,
          name: "Chris",
          team: "red",
          health: 100,
          luck: 15,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: false,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 9,
          pos_x: 10,
          pos_y: 5,
          name: "Jared",
          team: "red",
          health: 100,
          luck: 1,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 1,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: false,
          attack: 5,
          move_range: 2,
          attack_range: 1
        },
        %{
          id: 10,
          pos_x: 10,
          pos_y: 6,
          name: "Ruth",
          team: "red",
          health: 100,
          luck: 10,
          weapon: %{id: 1, name: "meglia", type: "sword", attack: 10},
          armor: %{
            id: 1,
            name: "jiateng",
            type: "lite_armor",
            luck: 2,
            defense: 5,
            move_range: -1
          },
          companion: %{id: 1, name: "sumbawa", type: "horse", move_range: 1, attack: 0},
          movable: false,
          attack: 5,
          move_range: 2,
          attack_range: 1
        }
      ]
    }

    new_socket =
      socket
      |> assign(:board, board)

    {:ok, new_socket}
  end

  def get_block_class(block_id, board) do
    {pos_x, pos_y} = Playground.Util.block_number_to_pos(block_id)
    selected = board.select
    warrior_selected? = {pos_x, pos_y} == {selected[:pos_x], selected[:pos_y]}

    warrior? =
      board.positions
      |> Enum.filter(fn character -> character.pos_x == pos_x and character.pos_y == pos_y end)
      |> List.first()

    cond do
      # is selected warrior and blue
      warrior_selected? and selected[:team] == "blue" ->
        "hover:border-green-600 border-4 hover:bg-green-200 border border-gray-800 cursor-pointer"

      # is selected warrior and red
      warrior_selected? and selected[:team] == "red" ->
        "hover:border-green-600 border-4 hover:bg-green-200 border border-gray-800 cursor-pointer"

      # is red warrior and attackable
      Enum.member?(board.legal_attack, {pos_x, pos_y}) and (warrior?[:team] || false) == "red" ->
        "bg-blue-100 border cursor-progress bg-red-200"

      # is blue warrior and attackable
      Enum.member?(board.legal_attack, {pos_x, pos_y}) and (warrior?[:team] || false) == "blue" ->
        "bg-red-100 border cursor-progress bg-blue-200"

      # is blue warrior but immutable
      warrior?[:movable] == false and warrior?[:team] == "blue" ->
        "bg-blue-200 border cursor-not-allowed"

      # is red warrior but immutable
      warrior?[:movable] == false and warrior?[:team] == "red" ->
        "bg-red-200 border cursor-not-allowed"

      # is blue warrior
      warrior?[:team] == "blue" ->
        "transition duration-300 ease-in-out hover:-translate-y-3 bg-blue-400 hover:border-blue-600 border-4 hover:bg-blue-200 border cursor-pointer"

      # is red warrior
      warrior?[:team] == "red" ->
        "transition duration-300 ease-in-out hover:-translate-y-3 bg-red-400 hover:border-red-600 border-4 hover:bg-red-200 border cursor-pointer"

      # is legal moves
      Enum.member?(board.legal_moves, {pos_x, pos_y}) ->
        "bg-green-300 border-4 border border-gray-800 cursor-pointer"

      # regular
      true ->
        "hover:border-green-600 border-4 hover:bg-green-200 border border-gray-800 cursor-pointer"
    end
  end

  def selected_border(_char, nil) do
    "border-gray-800"
  end

  def selected_border(char, selected_char) do
    if {char.pos_x, char.pos_y} == {selected_char.pos_x, selected_char.pos_y} do
      "border-black border-4 animate-bounce "
    else
      "border-gray-800"
    end
  end

  def get_block_player_name(block_id, board) do
    {x, y} = Playground.Util.block_number_to_pos(block_id)

    char =
      board.positions
      |> Enum.filter(fn character -> character.pos_x == x and character.pos_y == y end)
      |> List.first()

    if is_nil(char) do
      ""
    else
      char.name
    end
  end

  def get_block_player(block_id, board) do
    {x, y} = Playground.Util.block_number_to_pos(block_id)

    board.positions
    |> Enum.filter(fn character -> character.pos_x == x and character.pos_y == y end)
    |> List.first()
  end

  def get_block_player_health(block_id, board) do
    {x, y} = Playground.Util.block_number_to_pos(block_id)

    char =
      board.positions
      |> Enum.filter(fn character -> character.pos_x == x and character.pos_y == y end)
      |> List.first()

    if is_nil(char) do
      ""
    else
      char.health
    end
  end

  def handle_info(:tick, socket) do
    board = socket.assigns.board

    new_board =
      case board.move_turn do
        :blue -> Map.put(board, :blue_time, board.blue_time - 1)
        :red -> Map.put(board, :red_time, board.red_time - 1)
      end

    {:noreply, socket |> assign(:board, new_board)}
  end

  def handle_event("click_block", %{"id" => id}, socket) do
    board = socket.assigns.board
    block_id = String.to_integer(id)
    mode = board.mode
    move_turn = board.move_turn
    selected_warrior = board.select

    all_blue_player = Enum.filter(board.positions, fn x -> x.team == "blue" end)
    all_red_player = Enum.filter(board.positions, fn x -> x.team == "red" end)

    {click_x, click_y} = Playground.Util.block_number_to_pos(block_id)

    warrior? = get_block_player(block_id, board)

    # clicking might change the state of the board, depends on the state.

    new_board =
      cond do
        move_turn == :blue and mode == :select_warrior ->
          legal_moves =
            Playground.Util.get_legal_moves(
              {warrior?[:pos_x], warrior?[:pos_y]},
              warrior?[:move_range],
              board
            )

          if warrior?[:team] == "blue" and warrior?[:movable] do
            Map.merge(board, %{select: warrior?, legal_moves: legal_moves, mode: :select_location})
          else
            board
          end

        move_turn == :blue and mode == :select_location ->
          if Enum.member?(board.legal_moves, {click_x, click_y}) do
            # calculate legal attack
            enemy_occupied_block = all_red_player |> Enum.map(fn x -> {x.pos_x, x.pos_y} end)

            legal_attack =
              Playground.Util.get_legal_moves({click_x, click_y}, selected_warrior[:attack_range])
              |> Enum.filter(fn location -> Enum.member?(enemy_occupied_block, location) end)

            next_mode = if legal_attack == [], do: :select_warrior, else: :select_target
            next_select = if legal_attack == [], do: nil, else: selected_warrior

            board
            |> move_player(selected_warrior[:id], click_x, click_y)
            |> Map.put(:mode, next_mode)
            |> Map.put(:select, next_select)
            |> Map.put(:legal_moves, [])
            |> Map.put(:legal_attack, legal_attack)
            |> switch_turn_if_eligible()
          else
            Map.merge(board, %{legal_moves: [], select: nil, mode: :select_warrior})
          end

        move_turn == :blue and mode == :select_target ->
          if Enum.member?(board.legal_attack, {click_x, click_y}) do
            board
            |> attack_warrior(click_x, click_y, selected_warrior)

            # |> switch_turn_if_eligible()
          else
            Map.merge(board, %{
              legal_moves: [],
              legal_attack: [],
              select: nil,
              mode: :select_warrior
            })
          end

        move_turn == :red and mode == :select_warrior ->
          legal_moves =
            Playground.Util.get_legal_moves(
              {warrior?[:pos_x], warrior?[:pos_y]},
              warrior?[:move_range],
              board
            )
            |> IO.inspect()

          if warrior?[:team] == "red" and warrior?[:movable] do
            Map.merge(board, %{select: warrior?, legal_moves: legal_moves, mode: :select_location})
            |> IO.inspect()
          else
            board
          end

        move_turn == :red and mode == :select_location ->
          if Enum.member?(board.legal_moves, {click_x, click_y}) do
            enemy_occupied_block = all_blue_player |> Enum.map(fn x -> {x.pos_x, x.pos_y} end)

            legal_attack =
              Playground.Util.get_legal_moves({click_x, click_y}, selected_warrior[:attack_range])
              |> Enum.filter(fn location -> Enum.member?(enemy_occupied_block, location) end)

            next_mode = if legal_attack == [], do: :select_warrior, else: :select_target
            next_select = if legal_attack == [], do: nil, else: selected_warrior

            board
            |> move_player(selected_warrior[:id], click_x, click_y)
            |> Map.put(:mode, next_mode)
            |> Map.put(:select, next_select)
            |> Map.put(:legal_moves, [])
            |> Map.put(:legal_attack, legal_attack)
            |> switch_turn_if_eligible()
          else
            Map.merge(board, %{legal_moves: [], select: nil, mode: :select_warrior})
          end

        move_turn == :red and mode == :select_target ->
          if Enum.member?(board.legal_attack, {click_x, click_y}) do
            board
            |> attack_warrior(click_x, click_y, selected_warrior)

            # |> switch_turn_if_eligible()
          else
            Map.merge(board, %{
              legal_moves: [],
              legal_attack: [],
              select: nil,
              mode: :select_warrior
            })
          end
      end

    {:noreply, assign(socket, :board, new_board)}
  end

  def switch_turn_if_eligible(board) do
    case board.move_turn do
      :blue ->
        count =
          board.positions
          |> Enum.filter(fn x -> x.team == "blue" end)
          |> Enum.filter(fn x -> x.movable == true end)
          |> Enum.count()

        if count == 0 do
          positions =
            board.positions
            |> Enum.map(fn x -> if x.team == "red", do: Map.put(x, :movable, true), else: x end)

          board |> Map.put(:positions, positions) |> Map.put(:move_turn, :red)
        else
          board
        end

      :red ->
        count =
          board.positions
          |> Enum.filter(fn x -> x.team == "red" end)
          |> Enum.filter(fn x -> x.movable == true end)
          |> Enum.count()

        if count == 0 do
          positions =
            board.positions
            |> Enum.map(fn x -> if x.team == "blue", do: Map.put(x, :movable, true), else: x end)

          board |> Map.put(:positions, positions) |> Map.put(:move_turn, :blue)
        else
          board
        end
    end
  end

  def get_hint(board) do
    case board.mode do
      :select_warrior -> "Select a warrior"
      :select_location -> "Where it moves to?"
      :select_target -> "Select attack target!"
      _ -> ""
    end
  end

  def move_player(board, player_id, x, y) do
    positions =
      board.positions
      |> Enum.map(fn player ->
        if player.id == player_id do
          player
          |> Map.put(:pos_x, x)
          |> Map.put(:pos_y, y)
          |> Map.put(:movable, false)
        else
          player
        end
      end)

    board
    |> Map.put(:positions, positions)
    |> Map.put(:legal_moves, [])
  end

  def attack_warrior(board, pos_x, pos_y, warrior) do
    warrior_target =
      board.positions
      |> Enum.filter(fn x ->
        x.pos_x == pos_x and x.pos_y == pos_y
      end)
      |> List.last()

    attack_warrior(board, warrior, warrior_target)
  end

  def attack_warrior(board, warrior, warrior_target) do
    result = calculate_attack(warrior, warrior_target)

    logs =
      "#{warrior.name} (##{warrior.id}) attack #{warrior_target.name} (##{warrior_target.id}). #{result.remark}"

    positions =
      board.positions
      |> Enum.map(fn x ->
        if x.id == warrior_target.id do
          Map.put(x, :health, x.health - result.health_impact)
        else
          x
        end
      end)
      |> Enum.filter(fn x -> x.health > 0 end)

    board
    |> Map.put(:positions, positions)
    |> Map.put(:logs, [logs | board.logs])
    |> Map.put(:legal_moves, [])
    |> Map.put(:legal_attack, [])
    |> Map.put(:select, nil)
    |> Map.put(:mode, :select_warrior)
  end

  def calculate_attack(warrior, warrior_target) do
    target_health = warrior_target.health

    target_defense = warrior_target[:armor][:defense] || 0

    randomize_target_luck = Enum.random(1..100)

    if randomize_target_luck <= warrior_target.luck do
      %{status: "attack_missed", health_impact: 0, remark: "Attack missed. Target is lucky."}
    else
      attack_power = warrior.attack + (warrior_target[:weapon][:attack] || 0)

      attacker_luck = warrior.luck + (warrior_target[:weapon][:luck] || 0)

      randomize_attacker_luck = Enum.random(1..100)

      if randomize_attacker_luck <= attacker_luck do
        attack_power = attack_power * 3

        if target_health < attack_power do
          %{
            status: "attack_success",
            health_impact: attack_power,
            remark:
              "Critical Hit. Target receive #{attack_power} damage. Target removed from arena."
          }
        else
          %{
            status: "attack_success",
            health_impact: attack_power,
            remark: "Critical Hit. Target receive #{attack_power} damage."
          }
        end
      else
        health_impact =
          if target_defense >= attack_power, do: 0, else: attack_power - target_defense

        if target_health < health_impact do
          %{
            status: "attack_success",
            health_impact: health_impact,
            remark: "Target receive #{health_impact} damage. Target removed from arena."
          }
        else
          %{
            status: "attack_success",
            health_impact: health_impact,
            remark: "Target receive #{health_impact} damage."
          }
        end
      end
    end
  end

  def get_health_class(warrior_health) do
    cond do
      warrior_health > 75 -> "bg-green-600"
      warrior_health > 50 -> "bg-yellow-600"
      warrior_health > 25 -> "bg-orange-600"
      warrior_health > 0 -> "bg-red-600"
      true -> ""
    end
  end

  def render(assigns) do
    ~L"""


    <div class="flex">


      <div class="w-3/4">
          <div class="text-center text-lg">Blue Team</div>
        <div class="grid grid-cols-10 gap-2">
        <%= for i <- 1..100 do %>



        <div title="Move here" phx-click="click_block" phx-value-id="<%= i %>" class="<%= get_block_class(i, @board) %> rounded-lg flex flex-col justify-center items-center h-24 w-20 p-1" >

          <% warrior = get_block_player(i, @board) %>
          <%= if is_nil(warrior) do %>
          <% else %>
          <img src="/images/<%= warrior[:id]%>.jpeg" class="rounded-lg border-2 border-gray-200 w-16 h-16"/>
          <div class="w-full bg-gray-200 h-1 mt-2 ">
            <div class="<%= get_health_class(warrior[:health]) %> h-1 " style="width: <%= warrior[:health] %>%"></div>
          </div>
        <% end %>


        </div>

        <% end %>
        </div>
        <div class="text-center text-lg">Red Team</div>
      </div>

      <div class="w-1/4">

        <div class="ml-4 p-4 rounded border border-2">

          <%= if @board.move_turn == :blue do %>

            <div class="text-2xl font-bold"><div class="text-blue-600">Blue Team</div> turn to move!</div>

            <div>Hint:  <%= get_hint(@board) %></div>

            <div class="font-semibold text-lg">Time remaining <%= @board.blue_time %> seconds</div>
            <div class="text-gray-400">Red Team remaining: <%= @board.red_time %> seconds</div>
          <% else %>
            <div class="text-2xl font-bold"><div class="text-red-600">Red Team</div> turn to move!</div>

            <div>Hint:  <%= get_hint(@board) %></div>

            <div class="font-semibold text-lg">Time remaining <%= @board.red_time %> seconds</div>
            <div class="text-gray-400">Blue Team remaining: <%= @board.blue_time %> seconds</div>

          <% end %>


        </div>



        <div class="ml-4 mt-8">


            <%= if not is_nil(@board.select) do %>

            <div class="p-4 border-dash border-2 rounded">

            <img src="/images/<%= @board.select[:id]%>.jpeg" class="rounded-lg border-2 border-gray-200 w-20 h-20"/>
            <div class="text-2xl"><%= @board.select[:name] %> </div>
            <div>❤️: <%= @board.select[:health] %> </div>
            <div>⚔️: <%= @board.select[:attack] %> </div>
            <div>🏃🏻: <%= @board.select[:move_range] %> </div>
            <div>🏹: <%= @board.select[:attack_range] %> </div>

            </div>
            <% end %>
        </div>

        <div class="ml-4 mt-8 rounded border-2">
        <%= for log <- @board.logs do %>

        <div class="font-mono text-sm"> <%= log %></div>

        <% end %>


        </div>


      </div>

    </div>


    """
  end
end
