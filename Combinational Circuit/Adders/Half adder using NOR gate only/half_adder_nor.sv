module half_adder_nor (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

    wire not_a;
    wire not_b;
    wire a_nor_b;

    nor g1 (not_a, a, a); 

    nor g2 (not_b, b, b);

    nor g3 (carry, not_a, not_b);

    nor g4 (a_nor_b, a, b);
  
    nor g5 (sum, a_nor_b, carry);

endmodule
