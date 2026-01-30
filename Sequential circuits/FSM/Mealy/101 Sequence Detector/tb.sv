`timescale 1ns/1ps

module mealy_101_detector_tb;

    reg clk;
    reg rst_n;
    reg in;
    wire out;

    mealy_101_detector uut (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        in = 0;

        #15 rst_n = 1;

        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | rst_n=%b | in=%b | state=%b | out=%b", 
                 $time, rst_n, in, uut.current_state, out);
    end

endmodule

