module gray_counter_tb;

    logic clk;
    logic rst_n;
    logic [3:0] gray_out;

    gray_counter u_dut (
        .clk(clk),
        .rst_n(rst_n),
        .gray_out(gray_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #20;
        
        rst_n = 1;
        
        #350;
        
        $finish;
    end

    initial begin
        $display("Time\t Gray Code\t Binary(Ref)");
        $display("------------------------------------");
        $monitor("%0t\t %b", $time, gray_out);
    end

    initial begin
        $dumpfile("gray_counter.vcd");
        $dumpvars(0, gray_counter_tb);
    end

endmodule
