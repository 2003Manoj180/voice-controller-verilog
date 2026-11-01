module voice_control (
input wire clk,
input wire reset,
input wire cmd_led_on,
input wire cmd_led_off,
input wire cmd_motor_on,
input wire cmd_motor_off,
output reg led_out,
output reg motor_enable
);
always @(posedge clk) begin
if (reset) begin
led_out <= 1'b0;
motor_enable <= 1'b0;
end
else begin
if (cmd_led_on)
led_out <= 1'b1;
else if (cmd_led_off)
led_out <= 1'b0;
if (cmd_motor_on)
motor_enable <= 1'b1;
else if (cmd_motor_off)
motor_enable <= 1'b0;
end
end
endmodule
