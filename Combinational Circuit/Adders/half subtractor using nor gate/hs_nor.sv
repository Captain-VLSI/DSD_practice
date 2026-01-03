////Half Subtractor using NOR gates  -- structural modelling
module hs_nor (input a,
               input b,
               output D,
               output B);
  wire g1, g2, g3;

  nor (g1,a,b);
  nor (B,a,g1);
  nor (g2,b,g1);
  nor (g3,B,g2);
  nor (D,g3,g3);

endmodule
