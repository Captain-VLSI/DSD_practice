module tb_8_1_mux;
  reg [7:0] d;
  reg [2:0] s;
  wire y;

  mux8 dut ( .d(d), .s(s), .y(y) );

  initial begin
    $display("Time |    d     | s | y ");
    $display("-----|----------|---|---");
    $monitor("%4t | %b | %d | %b", $time, d, s, y);
    
    d = 8'b10101010;
    s = 0; #10; 
    s = 1; #10;
    s = 2; #10;
    s = 3; #10; 
    s = 4; #10; 
    s = 5; #10; 
    s = 6; #10; 
    s = 7; #10; 

    d = 8'b11110000;
    s = 0; #10; 
    s = 7; #10; 
 
    $finish;
  end
endmodule
