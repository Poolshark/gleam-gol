import gleam/io
import lib/initial_conditions.{type InitialConditions, set_initial_conditions}
import lib/print_grid_helpers.{print_grid}
import lib/create_grid_helpers.{type GridParams, create_grid}
import lib/grid_manipulation_helpers.{update_grid}
import gleam/erlang/process
import shellout.{LetBeStdout, command}

fn runner(
  grid: List(List(Int)),
  run_time: Int,
  intervall: Int,
  total_time: Int,
  grid_params: GridParams,
) -> Nil {
  case run_time <= total_time {
    True -> {
      case run_time {
        0 -> Nil
        _ -> {
          io.print("\u{001b}[H\u{001b}[2J")
          Nil
        }
      }
      print_grid(grid)
      process.sleep(intervall)
      let t = update_grid(grid, grid, 0, 0, grid_params)
      runner(t, run_time + intervall, intervall, total_time, grid_params)
    }
    False -> Nil
  }
}

fn run(
  run_time: Int,
  intervall: Int,
  total_time: Int,
  initial: InitialConditions,
  grid_size: #(Int, Int),
) {
  let grid_params = case initial {
    initial_conditions.Random -> #(grid_size.0, grid_size.1, True)
    _ -> #(grid_size.0, grid_size.1, False)
  }
  let grid = set_initial_conditions(create_grid(grid_params), initial)
  runner(grid, run_time, intervall, total_time, grid_params)
}

pub fn main() {
  let _ = command(run: "clear", in: ".", with: [], opt: [LetBeStdout])
  io.print("\u{001b}[?25l")

  run(0, 50, 20_000, initial_conditions.Random, #(80, 25))
}
