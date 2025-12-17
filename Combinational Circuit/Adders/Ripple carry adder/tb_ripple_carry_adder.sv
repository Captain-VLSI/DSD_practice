
module tb_ripple_carry_adder;
 reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

  ripple_carry_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial begin
           a = 4'b0000; b = 4'b0000; cin = 1'b0;
        // Test vector 1
        #10 a = 4'b0011; b = 4'b0101; cin = 1'b0; 
        // Test vector 2
        #10 a = 4'b1111; b = 4'b0001; cin = 1'b0; 
        // Test vector 3
        #10 a = 4'b1010; b = 4'b0101; cin = 1'b1; 
        // Test vector 4
        #10 a = 4'b1111; b = 4'b1111; cin = 1'b1; 
        #10 $finish;
    end
    initial begin
      $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b carry=%b", $time, a, b, cin, sum, carry);
    end
endmodule
