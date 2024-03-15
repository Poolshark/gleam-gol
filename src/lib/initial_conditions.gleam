import lib/cell_manipulation_helpers.{update_cell_value}

pub type InitialConditions {
  // Random Seed
  Random

  // Still Life
  Block
  Beehive
  Loaf
  Boat
  Tub
  AircraftCarrier

  // Oscillator
  Blinker
  Toad
  Beacon
  Pulsar
  Pentadecathlon

  // Spaceship
  Glider
  LightweightSpaceship
  MiddleweightSpaceship
  HeavyweightSpaceship
}

// TODO: Veryfy if correct implementations
/// Set the initial conditions of the grid with known patterns
pub fn set_initial_conditions(
  grid: List(List(Int)),
  init_type: InitialConditions,
) {
  case init_type {
    // Random Seed
    Random -> grid

    // Still Life
    Block -> {
      update_cell_value(grid, 0, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(1, 0, 1)
      |> update_cell_value(1, 1, 1)
    }
    Beehive -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(2, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(3, 1, 1)
      |> update_cell_value(1, 2, 1)
      |> update_cell_value(2, 2, 1)
    }
    Loaf -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(2, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(3, 1, 1)
      |> update_cell_value(1, 2, 1)
      |> update_cell_value(3, 2, 1)
      |> update_cell_value(2, 3, 1)
    }
    Boat -> {
      update_cell_value(grid, 0, 0, 1)
      |> update_cell_value(1, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(2, 1, 1)
      |> update_cell_value(1, 2, 1)
    }
    Tub -> {
      update_cell_value(grid, 0, 1, 1)
      |> update_cell_value(1, 0, 1)
      |> update_cell_value(1, 2, 1)
      |> update_cell_value(2, 1, 1)
    }
    AircraftCarrier -> {
      update_cell_value(grid, 0, 0, 1)
      |> update_cell_value(1, 0, 1)
      |> update_cell_value(2, 0, 1)
      |> update_cell_value(3, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(4, 2, 1)
      |> update_cell_value(0, 3, 1)
      |> update_cell_value(4, 3, 1)
      |> update_cell_value(0, 4, 1)
      |> update_cell_value(1, 4, 1)
      |> update_cell_value(2, 4, 1)
      |> update_cell_value(3, 4, 1)
    }

    // Oscillator
    Blinker -> {
      update_cell_value(grid, 0, 1, 1)
      |> update_cell_value(1, 1, 1)
      |> update_cell_value(2, 1, 1)
    }
    Toad -> {
      update_cell_value(grid, 1, 1, 1)
      |> update_cell_value(2, 1, 1)
      |> update_cell_value(3, 1, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(1, 2, 1)
      |> update_cell_value(2, 2, 1)
    }
    Beacon -> {
      update_cell_value(grid, 0, 0, 1)
      |> update_cell_value(1, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(3, 2, 1)
      |> update_cell_value(2, 3, 1)
      |> update_cell_value(3, 3, 1)
    }
    Pulsar -> {
      update_cell_value(grid, 2, 0, 1)
      |> update_cell_value(3, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(8, 0, 1)
      |> update_cell_value(9, 0, 1)
      |> update_cell_value(10, 0, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(5, 2, 1)
      |> update_cell_value(7, 2, 1)
      |> update_cell_value(12, 2, 1)
      |> update_cell_value(0, 3, 1)
      |> update_cell_value(5, 3, 1)
      |> update_cell_value(7, 3, 1)
      |> update_cell_value(12, 3, 1)
      |> update_cell_value(0, 4, 1)
      |> update_cell_value(5, 4, 1)
      |> update_cell_value(7, 4, 1)
      |> update_cell_value(12, 4, 1)
      |> update_cell_value(2, 5, 1)
      |> update_cell_value(3, 5, 1)
      |> update_cell_value(4, 5, 1)
      |> update_cell_value(8, 5, 1)
      |> update_cell_value(9, 5, 1)
      |> update_cell_value(10, 5, 1)
      |> update_cell_value(2, 7, 1)
      |> update_cell_value(3, 7, 1)
      |> update_cell_value(4, 7, 1)
      |> update_cell_value(8, 7, 1)
      |> update_cell_value(9, 7, 1)
      |> update_cell_value(10, 7, 1)
      |> update_cell_value(0, 8, 1)
      |> update_cell_value(5, 8, 1)
      |> update_cell_value(7, 8, 1)
      |> update_cell_value(12, 8, 1)
      |> update_cell_value(0, 9, 1)
    }
    Pentadecathlon -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(2, 0, 1)
      |> update_cell_value(3, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(5, 0, 1)
      |> update_cell_value(6, 0, 1)
      |> update_cell_value(7, 0, 1)
      |> update_cell_value(8, 0, 1)
      |> update_cell_value(9, 0, 1)
      |> update_cell_value(1, 1, 1)
      |> update_cell_value(3, 1, 1)
      |> update_cell_value(4, 1, 1)
      |> update_cell_value(5, 1, 1)
      |> update_cell_value(6, 1, 1)
      |> update_cell_value(7, 1, 1)
      |> update_cell_value(9, 1, 1)
    }

    // Spaceship
    Glider -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(2, 1, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(1, 2, 1)
      |> update_cell_value(2, 2, 1)
    }
    LightweightSpaceship -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(4, 2, 1)
      |> update_cell_value(0, 3, 1)
      |> update_cell_value(3, 3, 1)
      |> update_cell_value(2, 4, 1)
      |> update_cell_value(3, 4, 1)
    }
    MiddleweightSpaceship -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(4, 2, 1)
      |> update_cell_value(0, 3, 1)
      |> update_cell_value(3, 3, 1)
      |> update_cell_value(2, 4, 1)
      |> update_cell_value(3, 4, 1)
    }
    HeavyweightSpaceship -> {
      update_cell_value(grid, 1, 0, 1)
      |> update_cell_value(4, 0, 1)
      |> update_cell_value(0, 1, 1)
      |> update_cell_value(0, 2, 1)
      |> update_cell_value(4, 2, 1)
      |> update_cell_value(0, 3, 1)
      |> update_cell_value(3, 3, 1)
      |> update_cell_value(2, 4, 1)
      |> update_cell_value(3, 4, 1)
    }
  }
}
