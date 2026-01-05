`timescale 1ns / 1ps

module tb_comparator;

  logic [1:0] A;
  logic [1:0] B;

  logic A_gt_B;
  logic A_eq_B;
  logic A_lt_B;

  comparator_2bit uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  initial begin

    $display("---------------------------------------------------");
    $display(" Time |  A   B  | A>B (GT) | A=B (EQ) | A<B (LT) ");
    $display("---------------------------------------------------");

    $monitor(" %4t |  %0d   %0d  |    %b     |    %b     |    %b   ", 
             $time, tb_A, tb_B, tb_greater, tb_equal, tb_less);

 
    for (int i = 0; i < 4; i++) begin
        for (int j = 0; j < 4; j++) begin
            tb_A = i; // Drive input A
            tb_B = j; // Drive input B
            #10;     
        end
    end

    $display("---------------------------------------------------");
    $display("Simulation Complete.");
    $finish; 
  end

endmodule
