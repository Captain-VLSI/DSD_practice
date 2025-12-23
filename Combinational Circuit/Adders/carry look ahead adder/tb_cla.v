
`timescale 1ns/1ps

module tb_cla_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;
 cla dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));


    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",
                  $time, a, b, cin, sum, cout);
    end

    initial begin
        $display("Starting CLA Testbench");

      a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;

        a = 4'b0011; b = 4'b0101; cin = 1'b0;  
        #10;

        a = 4'b0111; b = 4'b0001; cin = 1'b0;
        #10;

        a = 4'b1111; b = 4'b0001; cin = 1'b0;  
        #10;

        a = 4'b1010; b = 4'b0101; cin = 1'b1; 
        #10;

        $display("Testbench completed");
        $finish;
    end

endmodule
