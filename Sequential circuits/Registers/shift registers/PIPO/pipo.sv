module pipo_register (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [3:0] d_in,
    output reg [3:0] q_out
);

    always @(posedge clk) begin
        if (rst) begin
            q_out <= 4'b0000;
        end else if (load) begin
            q_out <= d_in;
        end
    end

endmodule
