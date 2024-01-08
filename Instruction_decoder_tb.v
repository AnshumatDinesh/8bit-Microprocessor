`include "Instruction_decoder.v"

`include "Clock_gen.v"
module Instruction_decoder_tb ();
    reg[7:0] InstructionRegister;
    reg SOD;
    wire EOD;
    wire ALE,RD,WR,IOM,S1,S0;
    wire RDA,RDX,RDF,RDW,RDZ,RDB,RDC,RDD,RDE,RDH,RDL;
    wire RDSP,RDPC;
    wire RDIR;
    wire WRA,WRX,WRF,WRW,WRZ,WRB,WRC,WRD,WRE,WRH,WRL;
    wire WRSP,WRPC;
    wire WRIR;
    wire Adbufin,Adabufina,Adabufinb;
    wire PCinc;
    wire Opsel;
    reg en;
    wire clk;
    Instruction_decoder ID(InstructionRegister,clk,SOD,EOD,ALE,RD,WR,IOM,S1,S0,RDA,RDX,RDF,RDW,RDZ,RDB,RDC,RDD,RDE,RDH,RDL,RDSP,RDPC,WRA,WRX,WRF,WRW,WRZ,WRB,WRC,WRD,WRE,WRH,WRL,WRSP,WRPC,Adbufin,Adabufina,Adabufinb,PCinc,Opsel);
    Clock_gen #(10)Clk(en,clk);
    initial begin
        $dumpfile("Instruction_decoder_tb.vcd");
        $dumpvars(0,Instruction_decoder_tb);
        $monitor("Time=%t",$time,);
        en=1'b1;
        #100
        en=1'b0;
    end
endmodule