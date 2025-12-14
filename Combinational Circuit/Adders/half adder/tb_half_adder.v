`timescale 1ns/1ps

module half_adder_tb;

    reg a;
    reg b;
    wire sum;
    wire carry;

    // Instantiate DUT
    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("  A  B  |  SUM  CARRY");

        // Monitor prints whenever any listed signal changes
        $monitor("  %b  %b  |   %b     %b", a, b, sum, carry);

        // Apply test vectors
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("Simulation completed");
        $finish;
    end

endmodule
