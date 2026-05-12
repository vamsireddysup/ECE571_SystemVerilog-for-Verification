module hw2_1b;

logic clk;
logic a,b,en;
logic [3:0]zd1,zd2,zd3;

//instantiate DUT's of all 3 Designs
primitiveGate D1(.a(a),.b(b),.en(en),.z(zd1));
contAssign D2(.a(a),.b(b),.en(en),.z(zd2));
alwaysComb D3(.a(a),.b(b),.en(en),.z(zd3));

//Clk Initialization
initial begin
clk = 1'b0;
end

//Clk Generation
always begin
#5 clk = ~clk;
end

initial begin 

$monitor ($time,"	", "en=%d b=%d a=%d Design_1=%d Design_2=%d Design_3=%d",en,b,a,zd1,zd2,zd3);

for(int i=0; i<8; i=i+1) begin
	{en,b,a}=i;
	#50;
end
$stop;
end

always @(*) begin

if((zd1!=zd2) && (zd1!=zd3) && (zd2!=zd3)) begin
$display("Outputs are not matched @%0t, zd1=%b, zd2=%b, zd3=%b",$time,zd1,zd2,zd3); 
$stop;
end
end
endmodule
