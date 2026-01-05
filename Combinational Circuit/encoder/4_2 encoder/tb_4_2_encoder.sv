module tb_encoder_4_2;
  reg [3:0] t_inputs; 
  wire y1, y0;

  encoder_4_2_bh uut (
    .i3(t_inputs[3]), 
    .i2(t_inputs[2]), 
    .i1(t_inputs[1]), 
    .i0(t_inputs[0]), 
    .y1(y1), 
    .y0(y0)
  );
  initial begin
    $monitor("Time=%0t | Input(3210)=%b | Output(y1y0)=%b%b", $time, t_inputs, y1, y0);
    
    t_inputs = 4'b0001;
    #10; 
    t_inputs = 4'b0010;
    #10;
    t_inputs = 4'b0100;
    #10;
    t_inputs = 4'b1000;
    #10;
    $finish;
  end

endmodule
