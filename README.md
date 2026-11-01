# Voice Control Using FPGA (Verilog)

Verilog design that controls an LED and a motor from four voice-command inputs (LED on/off, motor on/off). Target board: Digilent Nexys A7-100T.

## Files
- `voice_control.v`: top module
- `tb_voice_control.v`: testbench
- `Nexys-A7-100T-voice-control.xdc`: pin constraints (add this file if you have it)

## Pin Mapping
| Signal | Connection | Pin |
|---|---|---|
| clk | CLK100MHZ | E3 |
| reset | BTNC (center button) | N17 |
| cmd_led_on | Peak OUT0 | JA1 / C17 |
| cmd_led_off | Peak OUT1 | JA2 / D18 |
| cmd_motor_on | Peak OUT2 | JA3 / E18 |
| cmd_motor_off | Peak OUT3 | JA4 / G17 |
| led_out | Onboard LED0 | H17 |
| motor_enable | L298N IN1 | JA7 / D17 |

## How It Works
- Commands are level-sensitive. Pulse a command input HIGH to set or clear the output.
- Reset drives `led_out` and `motor_enable` LOW.

## Simulation
Run `tb_voice_control.v` with `voice_control.v` in Icarus Verilog (EDA Playground) or Vivado. `led_out` and `motor_enable` should go HIGH and LOW following the commands.

## Hardware and Safety Notes
- Verify the Peak V3 output mapping and voltage before connecting. FPGA I/O is 3.3 V, so use level shifting if needed.
- L298N: ENA jumper installed, IN1 = JA7/D17, IN2 = GND, motor on OUT1/OUT2, motor supply to VS/+12V, supply negative to GND. Common ground with the FPGA is required.
- Never connect 12 V to the FPGA. Keep the motor supply OFF while wiring and during initial tests.
- This is a starter implementation. Bench-test it before applying motor power.
