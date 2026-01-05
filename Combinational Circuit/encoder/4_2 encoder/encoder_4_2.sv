module encoder_4_2_dataflow (
    input i0, i1, i2, i3,
    output y1, y0
);
    assign y1 = i2 | i3;
    assign y0 = i1 | i3;

endmodule
