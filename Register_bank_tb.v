`include "Register_bank.v"
`include "Clock_gen.v"

module Register_bank_tb ();
    reg[7:0]Din;
    reg RW,En,en;
    reg[2:0] RS;
    wire clk;
    wire[7:0]Dout;
    Clock_gen #(10) Clk(.en(en),.clk(clk));
    Register_bank RB(.Din(Din),.RS(RS),.En(En),.clk(clk),.RW(RW),.Dout(Dout));
    initial begin
        $dumpfile("Register_bank_tb.vcd");
        $dumpvars(0,Register_bank_tb);
        $monitor("Time=%t RS=%o Datain=%h Dataout=%h RW=%b",$time,RS,Din,Dout,RW);
        $display("Writing into registers");
        en='b1;
        RS='o0;
        En='b1;
        RW='b0;
        Din='hf1;
        #100
        RS='o1;
        En='b1;
        RW='b0;
        Din='hf2;
        #100
        RS='o2;
        En='b1;
        RW='b0;
        Din='hf3;
        #100
        RS='o3;
        En='b1;
        RW='b0;
        Din='hf4;
        #100
        RS='o4;
        En='b1;
        RW='b0;
        Din='hf5;
        #100
        RS='o5;
        En='b1;
        RW='b0;
        Din='hf6;
        #100
        RS='o6;
        En='b1;
        RW='b0;
        Din='hf7;
        #100
        RS='o7;
        En='b1;
        RW='b0;
        Din='hf8;
        #100
        $display("reading from registers");
        RS='o0;
        En='b1;
        RW='b1;
        Din='hf1;
        #100
        RS='o1;
        En='b1;
        RW='b1;
        Din='hf2;
        #100
        RS='o2;
        En='b1;
        RW='b1;
        Din='hf3;
        #100
        RS='o3;
        En='b1;
        RW='b1;
        Din='hf4;
        #100
        RS='o4;
        En='b1;
        RW='b1;
        Din='hf5;
        #100
        RS='o5;
        En='b1;
        RW='b1;
        Din='hf6;
        #100
        RS='o6;
        En='b1;
        RW='b1;
        Din='hf7;
        #100
        RS='o7;
        En='b1;
        RW='b1;
        Din='hf8;
        #100
        en=1'b0;
    end
endmodule