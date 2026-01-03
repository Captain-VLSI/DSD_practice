/// 2-bit multiplier using data flow

module multiplier_2bit_dataflow (
    input [1:0] a,
    input [1:0] b,
    output [3:0] p
);
    wire p0, p1, p2, p3;
    wire c1;

    assign p[0] = a[0] & b[0];

    assign p[1] = (a[1] & b[0]) ^ (a[0] & b[1]);
    assign c1   = (a[1] & b[0]) & (a[0] & b[1]);

    assign p[2] = (a[1] & b[1]) ^ c1;
    assign p[3] = (a[1] & b[1]) & c1;

endmodule
