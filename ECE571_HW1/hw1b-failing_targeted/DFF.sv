// D flip-flop with asynchronous reset ? RTL model
module DFF(
output logic q,
input logic d, clk, reset
);
always_ff @(negedge clk or posedge reset) begin
if (reset)
q <= 1'b0;
else
q <= d;
end
endmodule : DFF
