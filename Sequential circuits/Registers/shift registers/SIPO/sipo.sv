module sipo_shift_register (
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg [3:0] q_out
);

    always @(posedge clk) begin
        if (rst) begin
            q_out <= 4'b0000;
        end else begin
            q_out <= {q_out[2:0], serial_in};
        end
    end

endmodule
