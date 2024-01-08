`include "ALU.v"

module ALU_tb ();
    reg[7:0] A,X;
    reg[2:0] Opsel;
    reg A_inv,X_inv,OP_inv;
    reg Carrybit;
    reg clk;
    wire[7:0] Z;
    wire[7:0]Flags;
    ALU ALU1(.A(A),.X(X),.Opsel(Opsel),.A_inv(A_inv),.X_inv(X_inv),.OP_inv(OP_inv),.Carrybit(Carrybit),.clk(clk),.Z(Z),.Flags(Flags));
    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0,ALU_tb);
        $monitor("Time=%t,A=%h,X=%h,OpSel=%o,A_inv=%b,X_inv=%b,OP_inv=%b,Carrybit=%b,Z=%h,Flags=%b",$time,A,X,Opsel,A_inv,X_inv,OP_inv,Carrybit,Z,Flags);
        clk='b0;
        #20
        $display("Testing AND");
        A='hAA;
        X='h33;
        Opsel='o0;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b0;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing NAND");
        A='hAA;
        X='h33;
        Opsel='o0;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing OR");
        A='hAA;
        X='h33;
        Opsel='o0;
        A_inv='b1;
        X_inv='b1;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing NOR");
        A='hAA;
        X='h33;
        Opsel='o0;
        A_inv='b1;
        X_inv='b1;
        OP_inv='b0;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing XOR");
        A='hAA;
        X='h33;
        Opsel='o1;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b0;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing XNOR");
        A='hAA;
        X='h33;
        Opsel='o1;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20

        $display("Testing Add");
        A='hAA;
        X='h33;
        Opsel='o2;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b0;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing Sub");
        A='hAA;
        X='h33;
        Opsel='o2;
        A_inv='b0;
        X_inv='b1;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing Right Shift");
        A='hAA;
        X='h33;
        Opsel='o3;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        #20
        $display("Testing Left Shift");
        A='hAA;
        X=A;
        Opsel='o2;
        A_inv='b0;
        X_inv='b0;
        OP_inv='b1;
        Carrybit='b0;
        clk='b1;
        #20
        clk='b0;
        
    end
endmodule