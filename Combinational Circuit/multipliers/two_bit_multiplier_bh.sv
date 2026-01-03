//////2 bit multiplier using behavioural medelling

module two_bit_multiplier_bh (input [1:0]a,
                              input [1:0]b,
                              output reg [3:0]p);

  always@(*)
    begin
      p=a*b;
    end
endmodule
