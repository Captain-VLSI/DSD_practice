module tb;
    reg clk;
    reg reset;
    reg en;
    reg up_down;
    wire [3:0] count;

  up_down_counter dut (.clk(clk),.reset(reset),.en(en),.up_down(up_down),.count(count));
  
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | en=%b | up=%b | Count=%d", $time, reset, en, up_down, count);

      $display("=========================================================");
      $display("========Up/Down Counter Simulation Started===============);
      $display("========================================================");

        reset = 1; en = 0; up_down = 0; #15;
        reset = 0; en = 1; up_down = 1; #100;
        up_down = 0; #100;

               $display("===========================================================");
               $display(==============Up/Down Counter Simulation Finished============);
               $display("===========================================================");
        
        $finish;
    end
endmodule
