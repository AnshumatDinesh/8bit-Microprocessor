module Clock_gen #(//clock generator for testing 
    parameter FREQ = 1//in MHz
)(
    input wire en,//enable pin
    output reg clk//clock output
);
    reg start_clk;
    parameter delay= 1000/(FREQ*2);//delay in nanoseconds
    always @(posedge en or negedge en) begin
        if(en)begin
            start_clk=1'b1;
        end
        else begin
            start_clk=1'b0;
        end
    end
    always @(posedge start_clk) begin
        if(start_clk)begin
            clk=1'b1;
        end
        
        while (start_clk) begin
            #(delay) clk=1'b0;
            #(delay) clk=1'b1;
        end
        clk=1'b0;
    end
endmodule