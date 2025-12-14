// half_adder.v
// Simple half adder: sum = a XOR b, carry = a AND b

module half_adder(
  input  a,
  input  b,
  output sum,
  output carry
);

// sum = a XOR b (addition bit without carry)
assign sum = a ^ b;

// carry = a AND b (carry out)
assign carry = a & b;

endmodule
