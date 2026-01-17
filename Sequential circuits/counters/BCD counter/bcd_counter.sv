module bcd_counter (
    input  logic       clk,
    input  logic       reset,
    output logic [3:0] count
);

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000;
        end
        else begin
            if (count == 4'd9)
                count <= 4'b0000;
            else
                count <= count + 1;
        end
    end

endmodule
