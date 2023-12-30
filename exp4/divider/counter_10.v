`timescale 1ns / 1ps
`include "divider.v"
`include "display7.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 10:54:27
// Design Name: 
// Module Name: counter_10
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


module counter_10(
    input [1:0] contral,
    input CLK,
    input rst_n,
    input [3:0]load_counter,
    input load_enable,
    output [6:0] odisplay,
    output [3:0] oQ,
    output o_CLK
    );
    divider divider_1(.contral(contral),.o_CLK(o_CLK),.CLK(CLK));
    reg [3:0] cnt;
    always@(posedge CLK) 
    begin 
        if(load_enable)
            cnt <= load_counter;
    end
    always@(posedge o_CLK ) 
    begin
        if(!rst_n) 
            cnt <= 0;
        else 
        begin
            cnt <= cnt+1;
            if(cnt == 4'b1001)
                cnt <= 0;  
        end
     end
     assign oQ = cnt;
     display7 _display7(.iData(cnt),.oData(odisplay));
endmodule
