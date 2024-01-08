`include "register.v"

module register_tb ();
    reg[7:0] Din;
    reg RS,clk,RW;
    wire[7:0] Dout;
    register r1(.Din(Din),.RS(RS),.clk(clk),.RW(RW),.Dout(Dout));
    initial begin
        $dumpfile("register_tb.vcd");
        $dumpvars(0,register_tb);
        $monitor("Time=%t\tDin=%h\tRS=%b,clk=%b,RW=%b,\tDout=%h",$time,Din,RS,clk,RW,Dout);
        Din='hff;
        RW=0;
        RS=0;
        clk='b1;
        #20
        clk='b0;
        #20
        RS=1;
        clk='b1;
        #20
        clk='b0;
        #20
        RW=1;
        clk='b1;
        #20
        clk='b0;

    end
endmodule