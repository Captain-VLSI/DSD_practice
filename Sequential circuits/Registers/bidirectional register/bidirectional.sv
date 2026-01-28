// 1. D Flip-Flop Primitive
module d_flip_flop (
    input wire clk,
    input wire rst_n,
    input wire d,
    output reg q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// 2. 4-to-1 Multiplexer Primitive
module mux_4to1 (
    input wire [1:0] sel,
    input wire in_0,  // Hold
    input wire in_1,  // Shift Right
    input wire in_2,  // Shift Left
    input wire in_3,  // Load
    output reg out
);
    always @(*) begin
        case (sel)
            2'b00: out = in_0;
            2'b01: out = in_1;
            2'b10: out = in_2;
            2'b11: out = in_3;
        endcase
    end
endmodule

// 3. Top Level: 4-Bit Structural Bidirectional Shift Register
module structural_bidir_reg (
    input wire clk,
    input wire rst_n,
    input wire [1:0] mode,       // s1, s0
    input wire [3:0] p_in,       // Parallel Input
    input wire s_in_right,       // Serial In (for Right Shift)
    input wire s_in_left,        // Serial In (for Left Shift)
    output wire [3:0] data_out   // Q outputs
);

    wire [3:0] mux_out; // Wires from MUX to D-FF

    // Stage 3 (MSB)
    mux_4to1 m3 (
        .sel(mode), 
        .in_0(data_out[3]),    // Hold
        .in_1(s_in_right),     // Shift Right (Serial In)
        .in_2(data_out[2]),    // Shift Left (from neighbor)
        .in_3(p_in[3]),        // Load
        .out(mux_out[3])
    );
    d_flip_flop f3 (.clk(clk), .rst_n(rst_n), .d(mux_out[3]), .q(data_out[3]));

    // Stage 2
    mux_4to1 m2 (
        .sel(mode), 
        .in_0(data_out[2]), 
        .in_1(data_out[3]),    // Shift Right (from neighbor)
        .in_2(data_out[1]),    // Shift Left (from neighbor)
        .in_3(p_in[2]), 
        .out(mux_out[2])
    );
    d_flip_flop f2 (.clk(clk), .rst_n(rst_n), .d(mux_out[2]), .q(data_out[2]));

    // Stage 1
    mux_4to1 m1 (
        .sel(mode), 
        .in_0(data_out[1]), 
        .in_1(data_out[2]),    // Shift Right (from neighbor)
        .in_2(data_out[0]),    // Shift Left (from neighbor)
        .in_3(p_in[1]), 
        .out(mux_out[1])
    );
    d_flip_flop f1 (.clk(clk), .rst_n(rst_n), .d(mux_out[1]), .q(data_out[1]));

    // Stage 0 (LSB)
    mux_4to1 m0 (
        .sel(mode), 
        .in_0(data_out[0]), 
        .in_1(data_out[1]),    // Shift Right (from neighbor)
        .in_2(s_in_left),      // Shift Left (Serial In)
        .in_3(p_in[0]), 
        .out(mux_out[0])
    );
    d_flip_flop f0 (.clk(clk), .rst_n(rst_n), .d(mux_out[0]), .q(data_out[0]));

endmodule
