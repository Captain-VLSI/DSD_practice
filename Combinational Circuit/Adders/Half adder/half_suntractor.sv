module half_subtractor (
    input  A,    // Minuend
    input  B,    // Subtrahend
    output D,    // Difference
    output BO    // Borrow Out
);

    // Difference: A XOR B
    assign D = A ^ B;

    // Borrow Out: (~A) & B
    assign BO = (~A) & B;

endmodule
