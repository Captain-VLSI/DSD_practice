module universal_shift_reg (
    input clk,
    input reset,
    input [1:0] select,
    input [3:0] d_in,
    input serial_in_left,
    input serial_in_right,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;
        end else begin
            case (select)
                2'b00: q <= q;
                2'b01: q <= {serial_in_right, q[3:1]};
                2'b10: q <= {q[2:0], serial_in_left};
                2'b11: q <= d_in;
                default: q <= q;
            endcase
        end
    end

endmodule
