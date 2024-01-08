`include "register.v"
module Register_bank (
    input wire[7:0] Din,//Data input from bus
    input wire[2:0] RS,
    //000- B
    //001- C
    //010- D
    //011- E
    //100- H
    //101- L
    //110- W
    //111- Z
    input wire RD,WR,clk,En,//All control signal same as that of the single register
    output wire[7:0] Dout//Data output onto the bus
 );
    wire [7:0] DataTemp[7:0];
    register W(.Din(Din),.RS((RS=='b110)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[0]));
    register Z(.Din(Din),.RS((RS=='b111)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[1]));
    register B(.Din(Din),.RS((RS=='b000)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[2]));
    register C(.Din(Din),.RS((RS=='b001)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[3]));
    register D(.Din(Din),.RS((RS=='b010)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[4]));
    register E(.Din(Din),.RS((RS=='b011)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[5]));
    register H(.Din(Din),.RS((RS=='b100)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[6]));
    register L(.Din(Din),.RS((RS=='b101)?1'b1:1'b0),.clk(clk),.RD(RD),.WR(WR),.Dout(DataTemp[7]));
    assign Dout=DataTemp[RS];
    
 endmodule