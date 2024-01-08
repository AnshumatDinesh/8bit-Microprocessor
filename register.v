module register (
    input wire[7:0] Din,//Data input to the register 
    input wire RS,clk,RD,RW,//RS is register select used to enable the register 
    //RD and RW are a Read/Write signal with write being active low 
    output reg[7:0] Dout//Data output of the register
);
    reg[7:0] D;//temperary storage inside the gated register
    always @(posedge clk ) begin//rissing edge triggered register
        if(RS)
        begin
            if(RD)
            begin
                Dout=D;
            end
            if(WR)
            begin
                D=Din;
            end
        end
    end
endmodule