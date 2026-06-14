// Top level module for 4-bit Ripple Carry Counter
module ripple_carry_counter (
output [3:0] count,
input clk, reset
);
// internal signals
logic q0, q1, q2, q3;
//instantiate 4 toggle flip-flops
TFF tff0(q0,clk, reset);
TFF tff1(q1,q0, reset);
TFF tff2(q2,q1, reset);
TFF tff3(q3,q2, reset);
assign count = {q3, q2, q1, q0};
endmodule : ripple_carry_counter
