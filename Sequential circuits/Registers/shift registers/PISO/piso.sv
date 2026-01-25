module piso_register (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [3:0] d_in,
    output wire serial_out
);

    reg [3:0] shift_reg;

    assign serial_out = shift_reg[3];

    always @(posedge clk) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else if (load) begin
            shift_reg <= d_in;
        end else begin
            shift_reg <= {shift_reg[2:0], 1'b0};
        end
    end

endmodule
