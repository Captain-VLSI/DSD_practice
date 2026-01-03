module fs_nand (input a,
                input b,
                input bin,
                output D,
                output B);
  wire g1,g2,g3,g4,g5,g6,g7;

  nand (g1,a,b);
  nand (g2,g1,a);
  nand (g3,g1,b);
  nand (g4,g2,g3);
  nand (g5,g4,bin);
  nand (g6,g4,g5);
  nand (g7,bin,g5);
  nand (D,g6,g7);
  nand (B,g7,bin);

endmodule
