module tb_sr_ff;
    reg clk;
    reg rst;
    reg s;
    reg r;
    wire q;
    wire q_bar;

    sr_ff uut (
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b s=%b r=%b | q=%b q_bar=%b", $time, rst, s, r, q, q_bar);

        clk = 0;
        rst = 0;
        s = 0;
        r = 0;

        #2 rst = 1;
        #10 rst = 0;

        #10 s = 1; r = 0; // Set
        #10 s = 0; r = 0; // Hold
        #10 s = 0; r = 1; // Reset
        #10 s = 0; r = 0; // Hold
        #10 s = 1; r = 1; // Invalid state

        #20 $finish;
    end
endmodule
