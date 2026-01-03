module full_adder_nand (input a,
                        input b,
                        input cin,
                        output sum,
                        output cout );

    wire g1, g2, g3, g4; 
    wire g5, g6, g7;     

    nand(g1, a, b);      
    nand(g2, a, g1);
    nand(g3, b, g1);
    nand(g4, g2, g3);    

    nand(g5, g4, cin);   
    nand(g6, g4, g5);
    nand(g7, cin, g5);
    nand(sum, g6, g7); 

    nand(cout, g1, g5);   

endmodule
