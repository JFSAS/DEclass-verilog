`timescale 1ns / 1ps
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
    output [6:0] odisplay
    );
    wire o_CLK;
    divider divider_1(.contral(contral),.o_CLK(o_CLK),.CLK(CLK));
    reg [3:0] cnt;
    always@(posedge o_CLK or negedge rst_n) 
    begin
        if(!rst_n) 
            cnt <= 0;
        else 
        begin
            cnt <= cnt+1;
            if(cnt == 4'b1010)
                cnt <= 0;  
        end
     end
     display7 _display7(.iData(cnt),.oData(odisplay));
endmodule
