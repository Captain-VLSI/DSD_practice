
module half_adder (
    input a, b,
    output sum, carry
);
    xor (sum, a, b);   
    and (carry, a, b);
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
module two_bit_multiplier_st (input [1:0] a,    
                              input [1:0] b,  
                              output [3:0] p);

    wire pp0, pp1, pp2, pp3; 
    wire c1;                
  
    and (p[0], a[0], b[0]);
    and (pp1, a[1], b[0]);  
    and (pp2, a[0], b[1]); 
    
    half_adder HA1 (
        .a(pp1), 
        .b(pp2), 
        .sum(p[1]), 
        .carry(c1));

  and (pp3, a[1], b[1]); 
  
    half_adder HA2 (
        .a(pp3), 
        .b(c1), 
        .sum(p[2]), 
        .carry(p[3]) 
    );

endmodule
