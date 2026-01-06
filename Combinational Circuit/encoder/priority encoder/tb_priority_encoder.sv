module tb_priority_encoder;
  reg[3:0]tb_Y;
  wire[1:0]tb_A;
  wire tb_V;

  priority_encoder_dataflow dut (tb_Y,tb_A,tb_V);
initial begin
  $display("=======simulation started=======");
  $display("Time | Y3 Y2 Y1 Y0 | A0 A1 | V ");
  $monitor("%4t | %b %b %b %b | %b %b | %b", $time, tb_Y[3],tb_Y[2],tb_Y[1],tb_Y[0],tb_A[0],tb_A[1],tb_V);

tb_Y=4'b0000;
#10;
tb_Y=4'b0001;
#10;
tb_Y=4'b0010;
#10;
tb_Y=4'b0100;
#10;
tb_Y=4'b1000;
#10;
 
  $display("=========simulation ended=========");
$finish;
end
endmodule
