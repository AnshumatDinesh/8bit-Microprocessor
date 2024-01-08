`include "full_adder.v"
module Adder (
    input wire[7:0] X,Y,//inputs to the adder module
    input wire Cin,//carry input
    input wire X_inv,Y_inv,//inverting input to do subtraction
    output wire[7:0]Z,//output of adder
    output wire Cout,ACout//carry and auxillary output
);
    wire[7:0] Op;
    wire[5:0] carryprop;
    assign Z=(X_inv||Y_inv)?Op+'d1:Op;
    full_adder FA7(.X(((X_inv)?~X[7]:X[7])),
                    .Y(((Y_inv)?~Y[7]:Y[7])),
                    .Z(Op[7]),.Cin(carryprop[5]),.Cout(Cout));
    full_adder FA6(.X(((X_inv)?~X[6]:X[6])),
                    .Y(((Y_inv)?~Y[6]:Y[6])),
                    .Z(Op[6]),.Cin(carryprop[4]),.Cout(carryprop[5]));
    full_adder FA5(.X(((X_inv)?~X[5]:X[5])),
                    .Y(((Y_inv)?~Y[5]:Y[5])),
                    .Z(Op[5]),.Cin(carryprop[3]),.Cout(carryprop[4]));
    full_adder FA4(.X(((X_inv)?~X[4]:X[4])),
                    .Y(((Y_inv)?~Y[4]:Y[4])),
                    .Z(Op[4]),.Cin(ACout),.Cout(carryprop[3]));
    full_adder FA3(.X(((X_inv)?~X[3]:X[3])),
                    .Y(((Y_inv)?~Y[3]:Y[3])),
                    .Z(Op[3]),.Cin(carryprop[2]),.Cout(ACout));
    full_adder FA2(.X(((X_inv)?~X[2]:X[2])),
                    .Y(((Y_inv)?~Y[2]:Y[2])),
                    .Z(Op[2]),.Cin(carryprop[1]),.Cout(carryprop[2]));
    full_adder FA1(.X(((X_inv)?~X[1]:X[1])),
                    .Y(((Y_inv)?~Y[1]:Y[1])),
                    .Z(Op[1]),.Cin(carryprop[0]),.Cout(carryprop[1]));
    full_adder FA0(.X(((X_inv)?~X[0]:X[0])),
                    .Y(((Y_inv)?~Y[0]:Y[0])),
                    .Z(Op[0]),.Cin(Cin),.Cout(carryprop[0]));
endmodule