// priority encoder 4_2 in case statements
module priority_encoder (
  input [3:0]D,
  output reg [1:0]Y   
);

  always @(*) begin
    casez(D)
      4'b1??? : Y=2'b11;
      4'b01?? : Y=2'b10;
      4'b001? : Y=2'b01;
      4'b0001 : Y=2'b00;
      default : Y=2'b00;
    endcase
  end
endmodule
