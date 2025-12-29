//2_1 mux in data flow

module mux_2_1 (input I, S,
                output Y);
  
  assign Y=S? I[1]: I[0];
  
end module  
