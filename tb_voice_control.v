`timescale 1ns/1ps
module tb_voice_control;
  reg clk, reset;
  reg cmd_led_on, cmd_led_off, cmd_motor_on, cmd_motor_off;
  wire led_out, motor_enable;

  voice_control uut (
    .clk(clk), .reset(reset),
    .cmd_led_on(cmd_led_on), .cmd_led_off(cmd_led_off),
    .cmd_motor_on(cmd_motor_on), .cmd_motor_off(cmd_motor_off),
    .led_out(led_out), .motor_enable(motor_enable)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_voice_control);
    $monitor("t=%0t led=%b motor=%b", $time, led_out, motor_enable);

    clk = 0; reset = 1;
    cmd_led_on = 0; cmd_led_off = 0;
    cmd_motor_on = 0; cmd_motor_off = 0;
    #20 reset = 0;

    #10 cmd_led_on = 1;    #10 cmd_led_on = 0;
    #20 cmd_motor_on = 1;  #10 cmd_motor_on = 0;
    #20 cmd_led_off = 1;   #10 cmd_led_off = 0;
    #20 cmd_motor_off = 1; #10 cmd_motor_off = 0;
    #30 $finish;
  end
endmodule
