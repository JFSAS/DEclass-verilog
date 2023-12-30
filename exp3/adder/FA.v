`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 16:09:29
// Design Name: 
// Module Name: FA
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


module FA(
    input iA,
    input iB,
    input iC,
    output oC,
    output oS
    );
    assign {oC,oS} = iA+iB+iC;
endmodule
