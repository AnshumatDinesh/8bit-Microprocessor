`include "Clock_gen.v"

module Clock_gen_tb ();
    reg en;
    wire clk;
    Clock_gen #(10)Clk(en,clk);
    initial begin
        $dumpfile("Clock_gen_tb.vcd");
        $dumpvars(0,Clock_gen_tb);
        $monitor("Time=%t\tclk=%b",$time,clk);
        en='b1;
        #1000
        en='b0;
    end
endmodule