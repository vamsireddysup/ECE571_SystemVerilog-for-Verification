// Toggle Flip-flop
module TFF (
output logic q,
input logic clk, reset
);
logic d;
// instantiate a D flip-flop
DFF dff0(.q, .d, .clk, .reset);
// create the toggle flip-flop by driving input with inverted output
not n1(d, q); // not is a Verilog provided primitive.
endmodule : TFF
