module t_ff (
    input clk,
    input rst,
    input t,
    output reg q,
    output q_bar
);
    assign q_bar = ~q;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
        end else begin
            if (t) 
                q <= ~q; 
            else 
                q <= q;   
        end
    end

endmodule
