module Program_counter (//Program counter 16 bit
    input wire[7:0] PCin,//input from bus
    input wire LD,Inc,clk,//control and timming signals
    output wire [15:0] PCout
);
    //implemnted by FSM
    reg[1:0] ps,ns='d0;//states of fsm
    reg[15:0] PC='h0000;//register of 166 bit storage
    assign PCout=PC;
    always@(posedge clk)
    begin
        ps=ns;
    end
    always @(LD,PCin,ps,PC) begin
        case (ps)
        2'b00:begin//Incremnt state
            if(LD)begin
                PC[7:0]=PCin;
                ns=2'b01;
            end
            else if(Inc) begin
                ns=2'b11;
                PC=PC+'d1;
            end
        end 
        2'b01:begin//Load State
            PC[15:8]=PCin;
            ns=2'b10;
        end
        2'b10:begin//Load State
            if(LD)begin
                PC[7:0]=PCin;
                ns=2'b01;
            end
            else begin
                ns=2'b00;
            end
        end
        2'b11:begin//Increment State
            if(LD)begin
                PC[7:0]=PCin;
                ns=2'b01;
            end
            else if(Inc) begin
                ns=2'b00;
                PC=PC+'d1;
            end
        end 
    endcase
end
    
endmodule