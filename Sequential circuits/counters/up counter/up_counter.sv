module up_counter(
  input clk,
  input rst,
  output reg[3:0] counter;
);

  always @(posedge clk)
    begin
    if(rst)
      counter<=0;
      else if (counter == 4'b1111)///code readability
  counter<=0;
  else
    counter<=counter+1;
    end
endmodule
