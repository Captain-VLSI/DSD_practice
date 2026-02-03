module moore_1011_detector (
    input  logic clk,
    input  logic reset_n,
    input  logic x,
    output logic z
);

    typedef enum logic [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always_comb begin
        case (current_state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S3 : S0;
            S3: next_state = x ? S4 : S2;
            S4: next_state = x ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    assign z = (current_state == S4);

endmodule
