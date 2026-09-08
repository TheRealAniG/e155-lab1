// Anirudh Gupta
// anirgupta@g.hmc.edu
// 9/7/2026
// This module tests that submodules are wired correctly, HSOSC produces a clock, and LED assign logic

`timescale 1 ns/1 ns

module top_tb ();
	
	logic [3:0] s;
	logic       reset;
    logic [6:0] seg;
    logic [2:0] led;
	logic       int_osc;

    top dut(
        .s(s),
        .reset(reset),
        .led(led),
		.seg(seg),
		.int_osc(int_osc)
    );

    // Apply stimuli and check outputs
    initial begin
        reset = 0;
        #22;
        reset = 1;

        // For each test case, set up the inputs, wait for the outputs
        // to update, and then check that the outputs match what we expect.
		// testing assign logic

        // Test 1 
        s = 4'b0000;                // setup inputs
        #10;                        // wait required time
        assert (led == 3'b000)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);

        // Test 2 
        s = 4'b0101;                // setup inputs
        #10;                        // wait required time
        assert (led == 3'b001)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);
			
		// Test 3 
        s = 4'b1010;                // setup inputs
        #10;                        // wait required time
        assert (led == 3'b001)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);
			
		// Test 4 
        s = 4'b1111;                // setup inputs
        #10;                        // wait required time
        assert (led == 3'b010)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);
			
		
		// Test 5 - connection to segment submodule
		s = 4'b1111;                // setup inputs
        #10;                        // wait required time
        assert (dut.segment.s == 4'b1111)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);
			
		
		// Test 6 - connection to blinker submodule
        #10;                        // wait required time
        assert (dut.blink.enable == 1)       // check outputs
            $display("PASSED! The top module behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The top module behaves incorrectly at time: %0t.", $time);
		
        #100;
        $stop;
    end

endmodule