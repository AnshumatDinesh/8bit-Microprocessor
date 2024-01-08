`include "Adder.v"
module ALU (
    input wire[7:0] A , X,
    /*Inputs to the ALU one of which is always Accumalator
    and the other is the temp register X*/
    input wire[2:0] Opsel,
    /*Selects which arthmetic, logic or shif operation to be performed 
    000-And
    001-Xor
    010-Add
    011-Shift right
    100-111-> reserved for future use
    */
    input wire A_inv,X_inv,OP_inv,
    /*Control signal to negate inputs and outputs allows us to implement nearly
    all major operations 
    */
    input wire Carrybit,
    input wire clk,
    output reg[7:0] Z,//Output register
    output wire[7:0] Flags
    /*Flags register
    SZ_Ac_P_C
    */

);
    wire Cout,ACout;
    wire [7:0] OpAdd,OpAnd,OpXor,OpShift;

    assign Flags[0]=(Opsel==3'b000)?Cout:(Opsel==3'b100)?A[0]:1'b0;
    assign Flags[4]=(Opsel==3'b000)?ACout:1'b1;
    assign Flags[7]=Z[7];

    assign OpAnd=((A_inv)?~A:A)&((X_inv)?~X:X);
    assign OpXor=((A_inv)?~A:A)^((X_inv)?~X:X);
    assign OpShift=((A_inv)?~A:A)>>1;

    Adder A1(.X(A),.Y(X),.Cin(Carrybit),.X_inv(A_inv),.Y_inv(X_inv),.Z(OpAdd),.Cout(Cout),.ACout(ACout));
    always @(negedge clk) begin
        case (Opsel)
            'b000:
            begin
                Z=(OP_inv)?~OpAnd:OpAnd;
            end
            'b001:
            begin
                Z=(OP_inv)?~OpXor:OpXor;
            end
            'b010:
            begin
                Z=OpAdd;
            end
            'b011:
            begin
                Z={Carrybit,OpShift[6:0]};
            end
        endcase
    end
endmodule