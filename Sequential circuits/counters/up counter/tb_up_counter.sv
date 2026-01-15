module tb;
    reg clk;
    reg rst;
    wire [3:0] counter;

    up_counter dut (.clk(clk), .rst(rst), .counter(counter));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | Count=%d", $time, rst, counter);

        $display("-----------------------------------------------------");
        $display("Up Counter Simulation Started");
        $display("-----------------------------------------------------");

        rst = 1; #15;
        rst = 0; #160;

        $display("-----------------------------------------------------");
        $display("Up Counter Simulation Finished");
        $display("-----------------------------------------------------");
        
        $finish;
    end
endmodule
