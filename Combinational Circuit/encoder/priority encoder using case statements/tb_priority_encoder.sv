// Code your testbench here
// or browse Examples
module tb_priority_enc;

  reg [3:0]tb_D;
  wire [1:0]tb_Y;

  priority_encoder dut (tb_D,tb_Y);
initial begin
  $display("===============================");
  $display("======Simulation started=======");
  $monitor("$time=%0t,D=%B, Y=%b",$time,tb_D,tb_Y);

 tb_D=4'b1000;
#10;
 tb_D=4'b1111;
#10;
tb_D=4'b0111;
#10;
tb_D=4'b001;
#10;

  $display("=======simulation ended=======");
$finish;
end
endmodule
