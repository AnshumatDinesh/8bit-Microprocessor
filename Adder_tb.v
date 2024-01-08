`include "Adder.v"

module Adder_tb ();
    reg[7:0] X,Y;
    reg Cin;
    reg X_inv,Y_inv;
    wire[7:0]Z;
    wire Cout,ACout;
    Adder A1(.X(X),.Y(Y),.Cin(Cin),.Z(Z),.X_inv(X_inv),.Y_inv(Y_inv),.Cout(Cout),.ACout(ACout));
    initial begin
        $dumpfile("Adder_tb.vcd");
        $dumpvars(0,Adder_tb);
        $monitor("Time=%t,X=%h,Y=%h,Cin=%b,Z=%h,Cout=%b,ACout=%b",$time,X,Y,Cin,Z,Cout,ACout);
        X='h0f;
        Cin='b0;
        Y='h01;
        X_inv=1'b0;
        Y_inv=1'b0;
        #20
        X='hff;
        Y='h06;
        Y_inv=1'b1;
        #20
        X='hff;
        Y='h06;
        X_inv=1'b1;
        Y_inv=1'b0;
    end
endmodule