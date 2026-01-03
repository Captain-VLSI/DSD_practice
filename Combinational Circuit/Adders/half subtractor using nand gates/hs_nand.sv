module hs_nand (input a,
                input b,
                output dout,
                output B0);

  wire g1,g2,g3;

  nand (g1,a,b);
  nand (g2,g1,a);
  nand (g3,g1,b);
  nand (dout,g2,g3);

  nand (B0,g3,g3);

endmodule
