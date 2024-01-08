`include "Program_counter.v"
`include "Clock_gen.v"

module Program_counter_tb ();
    reg[7:0]PCin;
    reg LD,en,Inc;
    wire clk;
    wire[15:0]PCout;
    Clock_gen #(10) Clk(en,clk);
    Program_counter PC(PCin,LD,Inc,clk,PCout);
    initial begin
        $dumpfile("Program_counter_tb.vcd");
        $dumpvars(0,Program_counter_tb);
        $monitor("Time=%t\tPCin=%h\tLD=%b\tPCout=%h",$time,PCin,LD,PCout);
        en=1'b1;
        Inc=1'b1;
        PCin='h00;
        LD='b0;
        #300
        Inc=1'b0;
        PCin='hff;
        LD='b1;
        #100
        PCin='hf0;
        LD='b0;
        #600
        PCin='h00;
        LD='b0;
        en=1'b0;

    end
endmodule