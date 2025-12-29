// Code your testbench here
// or browse Examples
module tb_mux_2_1;

  reg [1:0]I;
  reg S;
  wire Y;

mux_2_1 dut(.I(I),.S(S),.Y(Y));

initial begin
  $monitor("Time=%0d, I[0]=%b,I[1]=%b, S=%b,Y=%b", $time,I[0], I[1], S, Y);
end
initial begin
 $display("-------------------------------------------------------");
  $display("mux_2_1 Testbench Simulation Started.");
        $display("-------------------------------------------------------");
         // case 1 selects 	I0
        I = 2'b00; S = 0;
        #10;

        I = 2'b01; S = 0;
        #10;

        // Case 2: Select I1
        I = 2'b10; S = 1;
        #10;

        I = 2'b11; S = 1;
        #10;
        
        I = 2'b01; S = 1;   // Expect Y = 0
        #10;
  
  
 $display("-------------------------------------------------------");
  $display("mux_2_1 Testbench Simulation Finished at time %0d", $time);
        $display("-------------------------------------------------------");
        $finish; 
end
endmodule

