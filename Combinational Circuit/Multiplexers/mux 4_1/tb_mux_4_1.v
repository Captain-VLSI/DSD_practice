`timescale 1ns/1ps

module tb_mux_4_1;

  reg  [3:0] I;
  reg  [1:0] S;
  wire       Y;

  mux_4_1 dut (
    .I(I),
    .S(S),
    .Y(Y)
  );

  initial begin
    $monitor("Time=%0t | I=%b S=%b | Y=%b",
              $time, I, S, Y);
  end
  
  initial begin
    $display("============================");
    $display("  MUX 4:1 Simulation Started");
    $display("============================");

    I = 4'b1010;   // I[3]=1, I[2]=0, I[1]=1, I[0]=0
    S = 2'b00; #10;
    S = 2'b01; #10;
    S = 2'b10; #10;
    S = 2'b11; #10;

    $display("============================");
    $display("  MUX 4:1 Simulation Completed");
    $display("============================");

    $finish;
  end

endmodule
