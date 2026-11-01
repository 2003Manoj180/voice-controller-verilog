## Nexys A7-100T only

## 100 MHz onboard clock
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }]

## Center button: active-HIGH reset
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { BTNC }]

## Peak V3 inputs: confirm OUT mapping and voltage before connecting
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports { cmd_led_on }]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { cmd_led_off }]
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { cmd_motor_on }]
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { cmd_motor_off }]

## Onboard LED0
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { LED0 }]

## JA7 / FPGA pin D17: connect to L298N IN1 after confirming 3.3 V logic compatibility
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports { motor_enable }]
