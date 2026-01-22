module siso (
    input wire clk,
    input wire rst,
    input wire s_in,
    output wire s_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else begin
            shift_reg <= {shift_reg[2:0], s_in}; 
        end
    end

    assign s_out = shift_reg[3];

endmodule
