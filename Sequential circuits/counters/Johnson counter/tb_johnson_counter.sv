module tb_johnson;
    reg clk;
    reg reset;
    wire [3:0] q;

    johnson_counter dut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | Q=%b", $time, reset, q);

        $display("-----------------------------------------------------");
        $display("Johnson Counter Simulation Started");
        $display("-----------------------------------------------------");

        reset = 1; #15;
        reset = 0; #160;

        $display("-----------------------------------------------------");
        $display("Johnson Counter Simulation Finished");
        $display("-----------------------------------------------------");
        
        $finish;
    end
endmodule
