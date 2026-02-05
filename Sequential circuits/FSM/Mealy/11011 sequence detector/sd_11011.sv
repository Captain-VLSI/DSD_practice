module sd_11011 (
    input wire clk,
    input wire rst_n,
    input wire in_bit,
    output reg pattern_det
);

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;

    reg [2:0] current_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        next_state = current_state; 

        case (current_state)
            S0: begin
                if (in_bit) next_state = S1;
                else        next_state = S0;
            end

            S1: begin
                if (in_bit) next_state = S2;
                else        next_state = S0;
            end

            S2: begin
                if (in_bit) next_state = S2;
                else        next_state = S3;
            end

            S3: begin
                if (in_bit) next_state = S4;
                else        next_state = S0;
            end

            S4: begin
                if (in_bit) next_state = S2;
                else        next_state = S0;
            end

            default: next_state = S0;
