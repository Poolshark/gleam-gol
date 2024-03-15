import gleam/int.{random}
import gleam/list.{append}

pub type GridParams =
  #(Int, Int, Bool)

/// A 2D grid of cells
pub fn create_grid(params: GridParams) -> List(List(Int)) {
  create_grid_runner([], 0, params)
}

/// Create grid with columns and rows 
fn create_grid_runner(
  list: List(List(Int)),
  y: Int,
  grid_params: GridParams,
) -> List(List(Int)) {
  case y < grid_params.1 {
    True ->
      create_grid_runner(
        append(list, [create_row([], 0, grid_params)]),
        y + 1,
        grid_params,
      )
    False -> list
  }
}

/// Create a row of cells
fn create_row(list: List(Int), x: Int, grid_params: GridParams) -> List(Int) {
  let state = case grid_params.2 {
    True -> random(2)
    False -> 0
  }
  case x < grid_params.0 {
    True -> create_row(append(list, [state]), x + 1, grid_params)
    False -> list
  }
}
