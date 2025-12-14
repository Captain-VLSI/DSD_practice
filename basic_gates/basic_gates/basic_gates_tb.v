`timescale 1ns/1ps

module basic_gates_tb;
  reg a, b;
  wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;

  basic_gates uut(.a(a), .b(b), .y_and(y_and), .y_or(y_or), .y_not(y_not), 
                       .y_nand(y_nand), .y_nor(y_nor), .y_xor(y_xor), .y_xnor(y_xnor));
  
  initial begin
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    $finish;
  end
endmodule