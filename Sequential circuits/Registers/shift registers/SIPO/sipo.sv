module sipo (output reg [3:0] q,
             input clk,
             input rst,
             input in);

always @(posedge clk or posedge rst)
       begin
          if(rst)
              q<=0;
              else
              q<={in,q[3:0]};
       end
endmodule
