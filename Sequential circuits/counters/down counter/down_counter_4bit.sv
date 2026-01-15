module down_counter(
    input clk,
    input rst,
    output reg [3:0] counter
);

    always @(posedge clk) begin
        if (rst)
            counter <= 4'b1111;
        else if (counter == 4'b0000)
            counter <= 4'b1111;
        else
            counter <= counter - 1;
    end

endmodule
