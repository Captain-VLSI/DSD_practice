`timescale 1ns/1ps

module tb_full_adder;

    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    // Instantiate DUT
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Print header once
        $display("==============================================");
        $display(" A  B  CIN | SUM  COUT");
        $display("==============================================");

        // Monitor changes continuously
        $monitor(" %b  %b   %b  |  %b     %b", a, b, cin, sum, cout);

        // Apply all input combinations
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;

        $display("==============================================");
        $display("Simulation completed");
        $finish;
    end

endmodule
