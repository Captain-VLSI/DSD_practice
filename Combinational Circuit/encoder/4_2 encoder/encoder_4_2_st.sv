module encoder_4_2_st (
    input i0, i1, i2, i3,
    output y1, y0
);    
    or gate1 (y1, i2, i3);
    or gate2 (y0, i1, i3);

endmodule
