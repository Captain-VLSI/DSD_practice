// Code your design here
module cla (input [3:0]a,
            input [3:0]b,
            input cin,
            output [3:0]sum,
            output cout );

  wire [3:0] G;
  wire [3:0] P; 
  wire [4:0] C; 

  assign C[0]=cin;
  
  assign G = a & b;
  assign P = a ^ b;
  
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  assign C[3] = G[2] |  (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

  assign sum  = P ^ C[3:0];
  assign cout = C[4];

endmodule
