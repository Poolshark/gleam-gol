# Conway's Game Of Life in Gleam

[<img src="https://gleam.run/images/lucy/lucy.svg" width="100"/>](https://gleam.run)

GleamLife: Experience the mesmerizing simplicity of Conway's Game of Life brought to life in Gleam. Harnessing the power of functional programming, this implementation offers a visually captivating journey into the realm of cellular automata, where patterns emerge and evolve with each iteration.

> **Note :** I want to emphasise taht I am very new to Gleam and thus some patterns might be a bit confusing. However, feel free to come up with suggestions of how to make it better, I'd be more than happy to see it evolve!

### Run the code

Run GOL with a **randomised** seed.

```sh
gleam run
```

For **testing purposes** you can also play around with the following parameters in `gol.gleam → run(run_time, intervall, total_time, initial, grid_size)`:

- `run_time` → set to `0` (determines the start time)
- `intervall` → update intervall in `ms`
- `total_time` → total program runtime in `ms`
- `initial` → determins the initial seeding condition. Can be one of the following:

  - `Random` → random seed
  - `Glider` → a _Spaceship_ seed which moves from the top left to the bottom right corner of the grid
  - `Blinker` → the most simple _static oscillator_
  - and many more. Check `lib/initial_conditions.gleam` for more. **NOTE: most of them are untestet!**

  Happy coding! 😊
