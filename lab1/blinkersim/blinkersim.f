-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/lab1_7segment.sv" 
"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/lab1_blinker.sv" 
"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/lab1_top.sv" 
"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/testbenchTOP.sv" 
"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/source/impl_1/testbenchBLINKER.sv" 
"C:/Users/anirgupta/Desktop/e155-lab1/e155-lab1/lab1/source/impl_1/tesbenchSEGMENT.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top blink_tb
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
