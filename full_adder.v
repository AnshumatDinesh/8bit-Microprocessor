module full_adder (//Boilerplate Full Adder code
    input wire X,Y,Cin,//not much to explain here
    output wire Z,Cout
);
    assign Z=X^Y^Cin;
    assign Cout=X&Y|Y&Cin|Cin&X;
endmodule