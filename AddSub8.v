`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 10:33:59 AM
// Design Name: 
// Module Name: AddSub8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module AddSub8(
    input [7:0] A,
    input [7:0] B,
    input sub,
    output [7:0] S,
    output ovfl
);
    wire [7:0] mux_out;
    
    
    wire [7:0] neg_B;
    assign neg_B = B ^ (8'b11111111);
    
    mux8bit mux(
        .A(B),
        .B(neg_B),  
        .Sel(sub),
        .C(mux_out)
    );
    
    adder8 adder(
        .A(A),
        .B(mux_out),
        .Cin(sub),  
        .S(S),
        .ovfl(ovfl),
        .Cout(Cout)
    );
endmodule