//Primitive Gate Method (hw2_1a-i)
//Design 1

module primitiveGate(
input logic a,b,en,
output logic [3:0]z
);

wire logic Abar,Bbar;
not V0(Abar,a),
    V1(Bbar,b);
nand N0(z[0],en,Abar,Bbar),
     N1(z[1],Abar,b,en),
     N2(z[2],Bbar,a,en),
     N3(z[3],a,b,en);

endmodule

//Using Continuous Assignment Operators (hw2_1a-ii)
//Design 2

module contAssign(
input logic a,b,en,
output logic [3:0]z
);

assign z[0] = (en?(a|b):1'b1);
assign z[1] = (en?(a|~b):1'b1);
assign z[2] = (en?(~a|b):1'b1);
assign z[3] = (en?(~a|~b):1'b1);

endmodule


//Using Always_Comb Logic
//Design 3

module alwaysComb(
input logic a,b,en,
output logic [3:0]z
);

always_comb begin
casez({en,b,a})
	3'b0??:z=4'b1111;
	3'b100:z=4'b1110;
	3'b101:z=4'b1011;
	3'b110:z=4'b1101;
	3'b111:z=4'b0111;
endcase
end

endmodule
