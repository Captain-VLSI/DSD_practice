module tb_mux_5_1;
    reg [4:0] I;
    reg [2:0] S;
    wire Y;
    reg expected_Y;
    integer k; // loop variable

    mux_5_1_st uut (
        .I(I), 
        .S(S), 
        .Y(Y)
    );

    initial begin
        $display("----------------------------------------------");
        $display("Starting Self-Checking Testbench for 5:1 MUX");
        $display("----------------------------------------------");

        for (k = 0; k < 50; k = k + 1) begin

            I = $random;
            S = $random % 8; // Limit S to 0-7
            #10;
          
            case (S)
                3'd0: expected_Y = I[0];
                3'd1: expected_Y = I[1];
                3'd2: expected_Y = I[2];
                3'd3: expected_Y = I[3];
                3'd4: expected_Y = I[4];
                default: expected_Y = 1'b0; // Cases 5, 6, 7 should be 0
            endcase

            // 5. Compare and Check
            if (Y !== expected_Y) begin
                $display("ERROR at time %0t", $time);
                $display(" Inputs: I=%b, S=%d", I, S);
                $display(" Expected: %b, Got: %b", expected_Y, Y);
                $stop; 
            end
        end

        $display("----------------------------------------------");
        $display("PASS: All 50 random vectors verified successfully!");
        $display("----------------------------------------------");
        $finish;
    end

endmodule
