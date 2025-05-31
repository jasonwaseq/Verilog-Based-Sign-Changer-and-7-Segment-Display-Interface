`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 10:34:40 AM
// Design Name: 
// Module Name: SignChanger
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

module SignChanger(
    input [7:0] a,
    input sign,
    output [7:0] d,
    output ovfl
);
    wire [7:0] zero;
    assign zero = 8'b00000000;
    
    AddSub8 addsub(
        .A(zero),
        .B(a),
        .sub(sign),
        .S(d),
        .ovfl(ovfl)
    );
endmodule