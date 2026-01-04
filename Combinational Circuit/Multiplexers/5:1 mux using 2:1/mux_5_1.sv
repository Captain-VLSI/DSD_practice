// 1. The Building Block (2:1 MUX)
module mux_2_1 (
    input a,  
    input b,  
    input s,  
    output y 
);
    assign y = s ? a : b;
endmodule

// 2. The Main Module (5:1 MUX)
module mux_5_1_st (
    input [4:0] I,
    input [2:0] S,
    output Y
);

    wire w1, w2, w3, w4, w5, w6;


    mux_2_1 m1 ( .a(I[1]), .b(I[0]), .s(S[0]), .y(w1) );
    mux_2_1 m2 ( .a(I[3]), .b(I[2]), .s(S[0]), .y(w2) );
    mux_2_1 m3 ( .a(1'b0), .b(I[4]), .s(S[0]), .y(w3) ); // Pad with 0 
    mux_2_1 m4 ( .a(1'b0), .b(1'b0), .s(S[0]), .y(w4) ); // Both unused

    mux_2_1 m5 ( .a(w2), .b(w1), .s(S[1]), .y(w5) );
    mux_2_1 m6 ( .a(w4), .b(w3), .s(S[1]), .y(w6) );

    mux_2_1 m7 ( .a(w6), .b(w5), .s(S[2]), .y(Y) );

endmodule
