`timescale 1ns/1ns
`default_nettype none
`define N_TV 16

module segment_tb();
 // Set up test signals
 logic clk, reset;
 logic s, seg, seg_expected;
 logic [31:0] vectornum, errors;
 logic [10:0] testvectors[10000:0]; // Vectors of format s[3:0]_seg[6:0]

 // Instantiate the device under test
 segment dut(.s(s), .seg(seg));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end

 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin
     $readmemb("segment_testvectors.tv", testvectors, 0, `N_TV - 1);
     vectornum = 0; errors = 0;
     reset = 1; #27; reset = 0;
   end
  // Apply test vector on the rising edge of clk
 always @(posedge clk)
   begin
       #1; {s, seg, seg_expected} = testvectors[vectornum];
   end
  initial
 begin
   // Create dumpfile for signals
   $dumpfile("segment_tb.vcd");
   $dumpvars(0, segment_tb);
 end
  // Check results on the falling edge of clk
 always @(negedge clk)
   begin
     if (~reset) // skip during reset
       begin
         if (seg != seg_expected)
           begin
             $display("Error: inputs: s=%b", s);
             $display(" outputs: seg=%b (%b expected)", seg, seg_expected);
             errors = errors + 1;
           end


       vectornum = vectornum + 1;

       if (testvectors[vectornum] === 11'bx)
         begin
           $display("%d tests completed with %d errors.", vectornum, errors);
           $finish;
         end
     end
   end
endmodule