// Anirudh Gupta
// anirgupta@g.hmc.edu
// 9/7/2026
// This module tests the reset, enable, and max count of the blinker LED

`timescale 1 ns/1 ns

module blink_tb ();

    logic clk;    // system clock
    logic reset;  // active high reset
    logic led;    // output LED

    blink #(.MAXCOUNT(5)) dut (
        .int_osc(clk),
        .reset(reset),
        .led(led)
    );

    // Generate clock
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    // Apply stimuli and check outputs
    initial begin
        reset = 1;
        #22;
        reset = 0;

        // For each test case, set up the inputs, wait for the outputs
        // to update, and then check that the outputs match what we expect.
        // A full clock cycle is #10.

        // Test 1 Reset
        reset = 1;                      // Set up inputs                         
        assert (dut.counter == 0)     // Check outputs
            $display("PASSED! The blinker behaves as desired at time: %0t.", $time);
        else
            $error("FAILED! The blinker behaves incorrectly at time: %0t.", $time);

        // Test 2 Enable LED and maxcount
        reset = 0;
        #50;
        assert (dut.counter == 0 && led == 1)
            $display("PASSED! The blinker behaves as desired at time: %0t.", $time);
        else
            $error("FAILED! The blinker behaves incorrectly at time: %0t.", $time);
			
        #100;
        $stop;
    end

endmodule