module tb_gray_counter;
    
    reg tb_clk;
    reg tb_rst_n;
    wire [3:0] tb_gray_out;

    gray_counter dut (tb_clk, tb_rst_n, tb_gray_out);

    // 1. Clock Gen
    initial begin
        tb_clk = 0;
        forever #5 tb_clk = ~tb_clk;
    end

    // 2. Stimulus & Flow Control
    initial begin
        $display("=====simulation started=======");
        
        tb_rst_n = 0; 
        #10;

        tb_rst_n = 1; 
        #10;

        tb_rst_n = 0; 
        #200;

        $display("======simulation Ended========");
        $finish();
    end

    // 3. Monitor (Fixed the %b)
    initial begin
        // %0d prints time without extra spaces
        // %b  prints the binary value
        $monitor("Time=%0d | Reset=%b | Gray Out=%b", $time, tb_rst_n, tb_gray_out);
    end

endmodule