// Stimulus module to test the ripple carry counter
// Toggle reset and watch it count
// NOTE: There are no external ports - typical for test benches
module stimulus;
logic clk;
logic reset;
logic[3:0] q;
logic[3:0] q_beh;
// instantiate the design under test (DUT)
ripple_carry_counter DUT(.clk(clk),.reset(reset),.count(q));
// Create the clk signal that drives the design block.
initial begin
clk = 1'b0;
end // initial block
always begin
#5 clk = ~clk;
end // always block

always_ff @(posedge reset or negedge clk) begin
if(reset)q_beh<=0;
else q_beh<=q_beh+1;
if(q != q_beh) begin
	$display("ERROR at: ", $time, " count is %b should be %b", q, q_beh);
//$stop;
end
end

// Monitor the outputs
initial begin
$monitor($time, " Output q = %d q_beh = %d",q, q_beh);
end

// Control the reset signal that drives the design block
initial begin : test_vectors
$display("Starting Simulation");
#0   reset = 1'b1;
#15  reset = 1'b0;
#100 reset = 1'b1;
#10 reset = 1'b0;
#200 reset = 1'b1;
#10 reset = 1'b0;
#20 $stop;
end : test_vectors
endmodule : stimulus
