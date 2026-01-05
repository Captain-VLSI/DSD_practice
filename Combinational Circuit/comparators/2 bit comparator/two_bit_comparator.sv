module comparator_2bit (
    input logic [1:0] A,
    input logic [1:0] B,
    output logic A_gt_B,
    output logic A_eq_B,
    output logic A_lt_B
);

  assign A_gt_B = (A[1]&(~B[1])) | ((A[1]==B[1]) & (A[0])&(~B[0])));
  assign A_eq_B = (A[1]==B[1]) & (A[0]==B[0]);
  assign A_lt_B = ((~A[1]) & B[1]) | ((A[1] == B [1]) & (~A[0]&B[0]));

endmodule


///////////////////////////Behavioural code////////////////////////////

module comparator_2bit (
    input logic [1:0] A,
    input logic [1:0] B,
    output logic A_gt_B,
    output logic A_eq_B,
    output logic A_lt_B
);

  always_comb begin

      A_gt_B = 0;
      A_eq_B = 0;
      A_lt_B = 0;

      if (A > B) begin
          A_gt_B = 1;
      end
      else if (A == B) begin
          A_eq_B=1;
      end
      else begin
          A_lt_B=1;
      end
  end

endmodule
