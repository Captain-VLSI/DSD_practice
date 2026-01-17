module tb;
    reg clk;
    reg reset;
    wire [3:0] count;

    bcd_counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | Count=%d", $time, reset, count);

        $display("-----------------------------------------------------");
        $display("BCD Counter Simulation Started");
        $display("-----------------------------------------------------");

        reset = 1; #15;
        reset = 0; #150;

        $display("-----------------------------------------------------");
        $display("BCD Counter Simulation Finished");
        $display("-----------------------------------------------------");
        
        $finish;
    end
endmodule
