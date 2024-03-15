import lib/create_grid_helpers.{type GridParams}
import lib/cell_manipulation_helpers.{update_cell_state, update_cell_value}

pub fn update_grid(
  cached_list: List(List(Int)),
  updated_list: List(List(Int)),
  x: Int,
  y: Int,
  grid_params: GridParams,
) {
  case y < grid_params.1 {
    True -> {
      case x < grid_params.0 {
        True -> {
          let new_state = update_cell_state(cached_list, x, y, grid_params)
          let upd = update_cell_value(updated_list, x, y, new_state)
          update_grid(cached_list, upd, x + 1, y, grid_params)
        }
        False -> update_grid(cached_list, updated_list, 0, y + 1, grid_params)
      }
    }
    False -> updated_list
  }
}
