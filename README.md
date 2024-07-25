# Parking Management System

## Overview

This repository contains the Verilog code for a parking management system, along with a testbench to simulate and verify its functionality. The system is designed to manage parking spaces for university and non-university vehicles, adjusting space allocation based on the time of day.

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

## Acknowledgments

This project was created to manage and simulate a parking system with dynamic space allocation.
