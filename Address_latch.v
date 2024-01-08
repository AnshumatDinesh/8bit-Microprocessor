module Address_latch (
    input wire[15:0] Addin,
    input wire clk,En,
    output reg [15:0]Addout
);
    always @(posedge clk) begin
        if (En) begin
            Addout=Addin;
        end
    end
endmodule