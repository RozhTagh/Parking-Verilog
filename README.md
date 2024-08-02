# Parking Management System

This Verilog project simulates a comprehensive parking management system for a university. The system prioritizes parking spaces for faculty and staff, dynamically adjusts based on the hour of the day, and provides clear outputs for the number of parked cars and available spaces.

The design includes a main module that manages parking logic and a testbench to verify and simulate the system's behavior under various scenarios. By using this system, universities can efficiently manage their parking resources, ensuring optimal space utilization and ease of access for faculty and staff.

![parking image](https://s32.picofile.com/file/8478020692/2308_i504_017_S_m005_c13_isometric_parking_illustration.jpg)

## Modules

### `parking`

This module manages the parking system. It tracks the number of university and non-university vehicles parked and adjusts available parking spaces based on the current time.

#### Parameters

- `more_space` (default: 500): The initial number of spaces allocated to university vehicles during peak hours.
- `less_space` (default: 200): The initial number of spaces allocated to non-university vehicles during peak hours.
- `step` (default: 50): The step size for reallocating spaces between university and non-university vehicles.

#### Inputs

- `car_entered`: Signal indicating a car has entered the parking lot.
- `is_uni_car_entered`: Signal indicating if the entered car is a university vehicle.
- `car_exited`: Signal indicating a car has exited the parking lot.
- `is_uni_car_exited`: Signal indicating if the exited car is a university vehicle.
- `current_hour` [5:0]: The current hour in a 24-hour format.

#### Outputs

- `uni_parked_car` [9:0]: The number of university vehicles currently parked.
- `parked_car` [9:0]: The number of non-university vehicles currently parked.
- `uni_vacated_space` [9:0]: The number of available parking spaces for university vehicles.
- `vacated_space` [9:0]: The number of available parking spaces for non-university vehicles.
- `uni_is_vacated_space`: Signal indicating if there are available spaces for university vehicles.
- `is_vacated_space`: Signal indicating if there are available spaces for non-university vehicles.

### `parking_TB`

This is the testbench module for simulating the `parking` module. It includes tasks to simulate the entry and exit of university and non-university vehicles.

#### Tasks

- `uni_car_enter`: Simulates a university car entering the parking lot.
- `non_uni_car_enter`: Simulates a non-university car entering the parking lot.
- `uni_car_exit`: Simulates a university car exiting the parking lot.
- `non_uni_car_exit`: Simulates a non-university car exiting the parking lot.

## Simulation

The `parking_TB` module includes an initial block that runs various test scenarios to simulate the behavior of the parking management system throughout the day. Each task simulates a car entering or exiting and prints the current status of parked cars and available spaces.

## Usage

To run the testbench, you'll need to have either ModelSim or `iverilog` installed on your computer. You can run the testbench with `iverilog` on macOS using the following command:
```
cd code
iverilog -o test parking_TB.v parking.v
vvp test
```

## Timing Analysis

The module was synthesized using Quartus Prime on the Arria II GX FPGA. Timing analysis provided the following results:

- **Maximum Frequency (Fmax):** 162.87 MHz
- **Setup Time:** 5.140 ns
- **Hold Time:** 0.327 ns

These results ensure the design operates reliably at the intended clock speeds.

## Acknowledgments

This project was created to manage and simulate a parking system with dynamic space allocation.

## Authors
- [Rozhin Taghizadegan](https://github.com/RozhTagh)
