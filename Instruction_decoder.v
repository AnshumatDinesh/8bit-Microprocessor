module Instruction_decoder (
    input wire[7:0] InstructionRegister,
    input wire clk,
    input wire Mode,
    //Register Bank 
    output reg RD_RB,WR_RB,En_RB,
    output reg[2:0] RS_RB
    //Program Counter
    output reg LD_PC,inc_PC
    //ALU 
    output reg [2:0] Opsel,
    output reg A_inv,X_inv,OP_inv,
    //Misc Register 
    output reg RD_A,RD_X,RD_OP
    output reg WR_A,WR_X
);
    parameter getImData = ;
    reg [7:0] ps,ns='h0;
    always @(posedge clk ) begin
        ps=ns;
    end
    always @(ps,InstructionRegister,Mode) begin
        case (ps)
            8'h00://Opcode fetch
            begin
                ns=8'h01
            end
            8'h01://Opcode fetch
            begin
                ns=8'h02
            end
            8'h02://Opcode decode
            begin
                case (Mode)
                    8'hf0://8bit Mode
                    begin
                        casex (InstructionRegister)
                        8'b00xxxxxx://MOV
                        begin
                            
                        end 
                        endcase
                    end
                endcase
            end
        endcase
    end
endmodule