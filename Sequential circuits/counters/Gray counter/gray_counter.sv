module gray_counter (
       input clk,
	   input rst_n,
	   input [3:0] gray_out
	   );
	
	   logic [3:0]bin_cnt;
	   
	   always_ff @(posedge clk or negedge rst_n)
	   begin
	   if(rst_n)
	   bin_cnt<= 4'b0;
	   else
	   bin_cnt<=bin_cnt+1;
	   end
	   
	   assign gray_out = bin_cnt ^ (bin_cnt>>1);
	   
	   endmodule