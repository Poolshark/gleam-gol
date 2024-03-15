import gleam/list.{each}
import gleam/io.{print}

/// Print a grid of cells to the console
pub fn print_grid(grid: List(List(Int))) {
  each(grid, fn(row) {
    each(row, fn(cell) { io.print(grid_out(cell)) })
    print("\n")
  })
}

/// Convert a cell value to a string
fn grid_out(v: Int) {
  case v {
    0 -> " "
    _ -> "🁢"
  }
}
