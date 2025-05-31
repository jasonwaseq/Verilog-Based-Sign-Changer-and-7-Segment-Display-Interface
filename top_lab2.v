`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 10:30:12 AM
// Design Name: 
// Module Name: top_lab2
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

module top_lab2(
    input [7:0] sw,       
    input btnU,           
    input btnR,          
    input clkin,        
    output [6:0] seg,     
    output dp,            
    output [3:0] an,      
    output [7:0] led      
);
    wire [7:0] d;         
    wire ovfl;            
    wire dig_sel;         
    wire [6:0] seg_lower; 
    wire [6:0] seg_upper; 
    
    assign led = sw;
    
    SignChanger sign_changer_inst(
        .a(sw),
        .sign(btnU),
        .d(d),
        .ovfl(ovfl)
    );
    
    hex7seg lower_seg(
        .n(d[3:0]),
        .seg(seg_lower)
    );
    
    hex7seg upper_seg(
        .n(d[7:4]),
        .seg(seg_upper)
    );
    
    lab2_digsel digsel_inst(
        .clkin(clkin),
        .greset(btnR),
        .digsel(dig_sel)
    );
    
    mux8bit seg_mux(
    .A({seg_lower}),  
    .B({seg_upper}),  
    .Sel(dig_sel),
    .C(seg)           
    );
    
    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = ~dig_sel;
    assign an[0] = dig_sel;
    
    assign dp = ~ovfl;
endmodule