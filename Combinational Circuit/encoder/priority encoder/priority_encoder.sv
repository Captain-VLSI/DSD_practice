module priority_encoder_dataflow(
  input [3:0] Y,  
    output [1:0] A, 
    output V      
);

    assign A[1] = Y[3] | Y[2];
    assign A[0] = Y[3] | (~Y[2] & Y[1]);
    assign V = |Y; // Reduction OR operator 

endmodule
