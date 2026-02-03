module tb_moore_1011;

    logic clk;
    logic reset_n;
    logic x;
    logic z;

    moore_1011_detector dut (
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .z(z)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset_n = 0;
        x = 0;

        #15 reset_n = 1;

        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(1); // Sequence detected here

        apply_bit(0);
        apply_bit(1);
        apply_bit(1); // Overlapping sequence detected here

        apply_bit(0);
        apply_bit(0);
        
        #20 $finish;
    end

    task apply_bit(input logic bit_in);
        @(posedge clk);
        #1 x = bit_in;
    endtask

    initial begin
        $monitor("Time=%0t | Reset=%b | x=%b | State=%s | z=%b", 
                 $time, reset_n, x, dut.current_state.name(), z);
    end

endmodule
