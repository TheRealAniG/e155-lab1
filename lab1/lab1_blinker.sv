//Anirudh Gupta
//anirgupta@g.hmc.edu
//9/6/2026
//This module blinks an led at 2.4 Hz

module blink(
	input   logic int_osc,
	input   logic reset,
	output  logic led
);

	logic [24:0] counter;
   
	// Counter
    always_ff @(posedge int_osc) begin
		if(reset == 0) begin
			counter <= 0;
		end
		//48 Mhz clock, so for 2.4Hz blink every 20 million cycles
		if(counter == 24'd19_999_999) begin
			counter <= 0;
			led <= 1'b1;
		end
		else begin
			counter <= counter + 1;
			led <= 1'b0;
		end
	end
endmodule
   
   
   
   
   
   
   