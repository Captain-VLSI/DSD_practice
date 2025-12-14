module half_subtractor_tb;
    reg  A;
    reg  B;
    wire D;
    wire BO;
  
    half_subtractor UUT (
        .A  (A),
        .B  (B),
        .D  (D),
        .BO (BO)
    );

    initial begin
        $monitor("Time=%0d | A=%b, B=%b | D (Diff)=%b, BO (Borrow)=%b", $time, A, B, D, BO);
    end
    initial begin
        $display("-------------------------------------------------------");
        $display("Half Subtractor Testbench Simulation Started.");
        $display("-------------------------------------------------------");
        
        A = 1'b0; B = 1'b0;
        #10; // Wait 10 time units
        A = 1'b0; B = 1'b0;
        #10;
        A = 1'b0; B = 1'b1;
        #10;
        A = 1'b1; B = 1'b0;
        #10;
        A = 1'b1; B = 1'b1;
        #10;
        
        $display("-------------------------------------------------------");
        $display("Half Subtractor Testbench Simulation Finished at time %0d", $time);
        $display("-------------------------------------------------------");
        $finish; 
    end

endmodule
