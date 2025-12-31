module tb_demux_1_4;
  reg I;
  reg [1:0]S;
  wire [3:0]Y;
 
  demux_1_4 dut (.I(I),.S(S),.Y(Y));

  initial begin 
    $monitor("$time=%d,I=%0b,S=%0b,Y=%0b", $time,I,S,Y);
  end
  initial begin
    $display("===================================================");
    $display("=======demux_1_4 simulation started================");
    $display("===================================================");

    I=0; S=2'b00; #10;
    I=1; S=2'b00; #10;
    I=1; S=2'b01; #10;
    I=1; S=2'b10; #10;
    I=1; S=2'b11; #10;
    
    $display("===================================================");
    $display("=======demux_1_4 simulation ended==================");
    $display("===================================================");

    $finish;
  end
endmodule
