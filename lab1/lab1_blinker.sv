//Anirudh Gupta
//anirgupta@g.hmc.edu
//9/6/2026
//This module blinks an led at 2.4 Hz

module blink #(parameter int WIDTH = 25, parameter int MAXCOUNT = 10000000)
(
	input   logic int_osc,
	input   logic reset,
	output  logic led
);

	logic [WIDTH-1:0] counter;
   
	// Counter
    always_ff @(posedge int_osc) begin
		if(reset == 0) begin
			counter <= 0;
			led <= 0;
		end
		//48 Mhz clock, so for 2.4Hz toggle every 10 million cycles
		else if(counter == MAXCOUNT-1) begin
			counter <= 0;
			led <= ~led;
		end
		// increase counter otherwise
		else begin
			counter <= counter + 1;
		end
	end
endmodule
   
   
   
   
   
   
   