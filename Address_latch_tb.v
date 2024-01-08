`include "Address_latch.v"
`include "Clock_gen.v"

module Address_latch_tb ();
    reg[15:0] Addin;
    reg En,en;
    wire clk;
    wire[15:0]Addout;
    Clock_gen #(10) Clk(en,clk);
    Address_latch ADL(Addin,clk,En,Addout);
    initial begin
        $dumpfile("Address_latch_tb.vcd");
        $dumpvars(0,Address_latch_tb);
        $monitor("Time=%t Addin=%h En=%b Addout=%h",$time,Addin,En,Addout);
        en=1'b1;
        Addin='hffff;
        En=1'b1;
        #100
        En=1'b0;
        Addin='h00ff;
    end
endmodule