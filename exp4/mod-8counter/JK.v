`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 09:33:37
// Design Name: 
// Module Name: JK
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


module JK(
    input CLK,
    input J,
    input K,
    input rst_n,
    output  reg Q
    );

    always @(posedge CLK ,negedge rst_n)
        begin
            
           if(!rst_n)
               Q <= 1'b0;
           else
               Q <= (J&(~Q))|((~K)&Q);
         end
endmodule
