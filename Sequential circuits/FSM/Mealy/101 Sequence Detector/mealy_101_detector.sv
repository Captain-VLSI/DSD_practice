module mealy_101_detector (
    input clk,
    input rst_n,
    input in,
    output reg out
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] current_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        out = 1'b0;
        case (current_state)
            S0: begin
                if (in) next_state = S1;
                else    next_state = S0;
            end
            S1: begin
                if (in) next_state = S1;
                else    next_state = S2;
            end
            S2: begin
                if (in) begin
                    next_state = S1;
                    out = 1'b1;
                end
                else begin
                    next_state = S0;
                end
            end
            default: next_state = S0;
        endcase
    end

endmodule
