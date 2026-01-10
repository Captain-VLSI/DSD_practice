module mux2_1 (
    input wire i0, i1,
    input wire sel,
    output wire y
);
    assign y = (sel) ? i1 : i0;
endmodule

module mux8_1 (
    input [7:0] d,
    input [2:0] s,
    output y
);
    wire t1, t2, t3, t4, t5, t6;

    mux2_1 m1 ( .i0(d[0]), .i1(d[1]), .sel(s[0]), .y(t1) );
    mux2_1 m2 ( .i0(d[2]), .i1(d[3]), .sel(s[0]), .y(t2) );
    mux2_1 m3 ( .i0(d[4]), .i1(d[5]), .sel(s[0]), .y(t3) );
    mux2_1 m4 ( .i0(d[6]), .i1(d[7]), .sel(s[0]), .y(t4) );

    mux2_1 m5 ( .i0(t1), .i1(t2), .sel(s[1]), .y(t5) );
    mux2_1 m6 ( .i0(t3), .i1(t4), .sel(s[1]), .y(t6) );

    mux2_1 m7 ( .i0(t5), .i1(t6), .sel(s[2]), .y(y)  );
endmodule
