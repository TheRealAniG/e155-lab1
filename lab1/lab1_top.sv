//Anirudh Gupta
//anirgupta@g.hmc.edu
//9/6/2026
//Top module
//Also controls LEDs based on switch inputs

module top(
	input   logic [3:0] s,
	input   logic       reset,
	output  logic [2:0] led,
	output  logic [6:0] seg,
	output 	logic       int_osc
);
	logic  enable;
   
    //Clock generation
	HSOSC #(.CLKHF_DIV(2'b00))
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
		 
	//modules
	blink blink(.int_osc(int_osc), .reset(reset), .enable(1), .led(led[2]));
	segment segment(.s(s), .seg(seg));
	
	//combinational logic for LEDs
	assign led[0] = s[0] ^ s[1];
	assign led[1] = s[2] & s[3];

endmodule