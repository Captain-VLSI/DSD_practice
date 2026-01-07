// Code your design here
module dec_to_bcd_enc (
  input [9:0]i,
  output reg [3:0]y         
);

  always @(*) begin
     case (1'b1) 
            i[9] : y = 4'b1001; 
            i[8] : y = 4'b1000;
            i[7] : y = 4'b0111;
            i[6] : y = 4'b0110;
            i[5] : y = 4'b0101;
            i[4] : y = 4'b0100;
            i[3] : y = 4'b0011;
            i[2] : y = 4'b0010;
            i[1] : y = 4'b0001;
            i[0] : y = 4'b0000;
            default : y = 4'b0000;
    endcase
  end
endmodule
