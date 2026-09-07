//Anirudh Gupta
//anirgupta@g.hmc.edu
//9/6/2026
//This module blinks an led at 2.4 Hz

module blink #(parameter int WIDTH = 25, parameter int MAXCOUNT = 20000000)
(
	input   logic int_osc,
	input   logic reset,
	output  logic led
);

	logic [WIDTH-1:0] counter;
   
	// Counter
    always_ff @(posedge int_osc) begin
		if(reset == 1) begin
			counter <= 0;
			led <= 0;
		end
		//48 Mhz clock, so for 2.4Hz blink every 20 million cycles
		else if(counter == MAXCOUNT-1) begin
			counter <= 0;
			led <= 1;
		end
		// LED off otherwise
		else begin
			counter <= counter + 1;
			led <= 0;
		end
	end
endmodule
   
   
   
   
   
   
   