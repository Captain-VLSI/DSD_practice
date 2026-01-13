module tb_t_ff;
  reg clk, rst, t;
  wire q, q_bar;

  t_ff uut (clk, rst, t, q, q_bar);

  always #5 clk = ~clk;

  initial begin
    $monitor("T=%0t rst=%b t=%b q=%b qb=%b", $time, rst, t, q, q_bar);
    
    clk = 0; rst = 0; t = 0;
    #2 rst = 1;
    #10 rst = 0;
    #10 t = 0;
    #10 t = 1;
    #10 t = 1;
    #10 t = 1;
    #10 t = 0;
    #20 $finish;
  end
endmodule
