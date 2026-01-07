module tb_dec_to_bcd_enc;
    reg [9:0] tb_i;
    wire [3:0] tb_y;
    integer k; 

    dec_to_bcd_enc dut (.i(tb_i),.y(tb_y));

    initial begin
        $display("============================");
        $display("===== Simulation Started =====");
      $monitor("Time=%0t | Input(Binary)=%b | Output(BCD)=%b (%0d)", $time, tb_i, tb_y, tb_y);

        for (k = 0; k <= 9; k = k + 1) begin
            tb_i = (1 << k); // Shifts '1' to the correct wire position
            #10;
        end
        tb_i = (1 << 9) | (1 << 1); 
        #10;
        $display("===== Simulation Ended =====");
        $finish;
    end
endmodule
