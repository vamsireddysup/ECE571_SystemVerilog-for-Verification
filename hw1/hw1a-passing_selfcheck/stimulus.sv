// Stimulus module to test the ripple carry counter
// Toggle reset and watch it count
// NOTE: There are no external ports - typical for test benches
module stimulus;
logic clk;
logic reset;
logic[3:0] q;
// instantiate the design under test (DUT)
ripple_carry_counter DUT(.clk(clk),.reset(reset),.count(q));
// Create the clk signal that drives the design block.
initial begin
clk = 1'b0;
end // initial block
always begin
#5 clk = ~clk;
end // always block
// Monitor the outputs
initial begin
$monitor($time, " Output q = %d",q);
end

// Control the reset signal that drives the design block
initial begin : test_vectors
#0   reset = 1'b1;
#15  reset = 1'b0;
#100 reset = 1'b1;


if ( q != 4'b1010 ) begin // or the appropriate value
$display("ERROR at: ", $time, " count is %b ", q, "should be 4'b1010" );
//$stop;
end

#10 reset = 1'b0;
#200 reset = 1'b1;

if ( q != 4'b0100 ) begin // or the appropriate value
$display("ERROR at: ", $time, " count is %b ", q, "should be 4'b0100" );
//$stop;
end

#10 reset = 1'b0;
#20 $stop;
end : test_vectors
endmodule : stimulus
