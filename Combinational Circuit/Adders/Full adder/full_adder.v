module half_adder (
    input  wire a,
    input  wire b,
    output wire sum,
    output wire carry
);

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule

//////////////////////////////////////////////////////////////////////////////////////


`include "half adder.sv"
module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    wire sum1;
    wire c1;
    wire c2;

    // First half adder
    half_adder HA1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(c1)
    );

    // Second half adder
    half_adder HA2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );

    // OR the carries
    assign cout = c1 | c2;

endmodule
