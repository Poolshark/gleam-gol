import gleam/result.{unwrap}
import gleam/list.{at, index_map}
import lib/create_grid_helpers.{type GridParams}

type Axis {
  X
  Y
}

/// Update a specific cell in a grid and return grid with updated value
pub fn update_cell_value(grid: List(List(Int)), x: Int, y: Int, val: Int) {
  index_map(grid, fn(row, i) {
    case i == y {
      True ->
        index_map(row, fn(cell, j) {
          case j == x {
            True -> val
            False -> cell
          }
        })
      False -> row
    }
  })
}

/// Update the state of a specific cell in a grid and 
/// return grid with updated value
/// The state of a cell is updated based on the state 
/// of its neighbors (GOL)
pub fn update_cell_state(
  grid: List(List(Int)),
  x: Int,
  y: Int,
  grid_params: GridParams,
) {
  let ru = get_fixed_pos(y - 1, Y, grid_params)
  let rd = get_fixed_pos(y + 1, Y, grid_params)
  let cl = get_fixed_pos(x - 1, X, grid_params)
  let cr = get_fixed_pos(x + 1, X, grid_params)

  let un = #(
    get_cell_value(grid, cl, ru),
    get_cell_value(grid, x, ru),
    get_cell_value(grid, cr, ru),
  )

  let ln = #(
    get_cell_value(grid, cl, rd),
    get_cell_value(grid, x, rd),
    get_cell_value(grid, cr, rd),
  )

  let dn = #(get_cell_value(grid, cl, y), get_cell_value(grid, cr, y))

  let sum = un.0 + un.1 + un.2 + ln.0 + ln.1 + ln.2 + dn.0 + dn.1

  case get_cell_value(grid, x, y) {
    0 ->
      case sum {
        3 -> 1
        _ -> 0
      }
    _ ->
      case sum < 2 {
        True -> 0
        False ->
          case sum <= 3 {
            True -> 1
            False -> 0
          }
      }
  }
}

fn get_fixed_pos(pos: Int, axis: Axis, grid_params: GridParams) {
  case pos < 0 {
    True ->
      case axis {
        X -> grid_params.0 + pos
        Y -> grid_params.1 + pos
      }
    False ->
      case axis {
        X ->
          case pos > grid_params.0 - 1 {
            True -> pos - grid_params.0
            False -> pos
          }
        Y ->
          case pos > grid_params.1 - 1 {
            True -> pos - grid_params.1
            False -> pos
          }
      }
  }
}

fn get_cell_value(list: List(List(Int)), x: Int, y: Int) {
  let outer = unwrap(at(list, y), [])
  unwrap(at(outer, x), 0)
}
