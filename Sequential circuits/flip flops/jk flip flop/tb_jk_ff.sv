module tb_jk_ff;
    reg clk, rst, j, k;
    wire q, q_bar;

    jk_ff uut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b | j=%b k=%b | q=%b q_bar=%b", $time, rst, j, k, q, q_bar);

        clk = 0; rst = 0; j = 0; k = 0;

        #2 rst = 1;
        #10 rst = 0;

        #10 j = 1; k = 0; 
        #10 j = 0; k = 0; 
        #10 j = 0; k = 1; 
        #10 j = 1; k = 1; 
        #10 j = 1; k = 1; 

        #20 $finish;
    end
endmodule
