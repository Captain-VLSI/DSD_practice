// Code your testbench here
module tb_full_sub;
  reg a, b, bin;
  wire d, bo;

  full_sub dut (.a(a), .b(b), .bin(bin), .d(d), .bo(bo));
  
  initial begin
    
    $monitor("Time=%0t | a=%b b=%b bin=%b | Difference=%b Borrow=%b", $time, a, b, bin, d, bo);

   
    $display("-----------------------------------------------------");
    $display("Full Subtractor Simulation Started");
    $display("-----------------------------------------------------");
   
    // Apply test vectors
    a=0; b=0; bin=0; #10;
    a=0; b=0; bin=1; #10;
    a=0; b=1; bin=0; #10;
    a=0; b=1; bin=1; #10;
    a=1; b=0; bin=0; #10;
    a=1; b=0; bin=1; #10;
    a=1; b=1; bin=0; #10;
    a=1; b=1; bin=1; #10;

 
    $display("-----------------------------------------------------");
    $display("Full Subtractor Simulation Finished");
    $display("-----------------------------------------------------");
    $finish;
  end
endmodule
