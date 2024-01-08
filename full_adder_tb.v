`include "full_adder.v"

module full_adder_tb ();
    reg X,Y,Cin;
    wire Z,Cout;
    full_adder FA(.X(X),.Y(Y),.Z(Z),.Cin(Cin),.Cout(Cout));
    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0,full_adder_tb);
        $monitor("Time=%t,X=%b,Y=%b,Cin=%b,Z=%b,Cout=%b",$time,X,Y,Cin,Z,Cout);
        X='b0;Y='b0;Cin='b0;
        #10
        X='b0;Y='b0;Cin='b1;
        #10
        X='b0;Y='b1;Cin='b0;
        #10
        X='b0;Y='b1;Cin='b1;
        #10
        X='b1;Y='b0;Cin='b0;
        #10
        X='b1;Y='b0;Cin='b1;
        #10
        X='b1;Y='b1;Cin='b0;
        #10
        X='b1;Y='b1;Cin='b1;
        #10
        X='b1;Y='b0;Cin='b0;
        #10
        X='b1;Y='b0;Cin='b1;
        #10
        X='b1;Y='b1;Cin='b0;
        #10
        X='b1;Y='b1;Cin='b1;
    end
endmodule