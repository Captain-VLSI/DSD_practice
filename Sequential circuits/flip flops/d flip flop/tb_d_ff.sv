module tb_d_ff;
    reg clk;
    reg rst;
    reg d;
    wire q;

    d_ff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b d=%b | q=%b", $time, rst, d, q);

        clk = 0;
        rst = 0;
        d = 0;

        #2 rst = 1;
        #10 rst = 0;

        #8 d = 1;
        #10 d = 0;
        #10 d = 1;

        #10 rst = 1;
        #5 rst = 0;

        #20;
        $finish;
    end
endmodule
