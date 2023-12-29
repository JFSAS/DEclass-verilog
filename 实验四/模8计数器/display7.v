`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 09:46:25
// Design Name: 
// Module Name: display7
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


module display7(
    input [3:0] iData,
    input [6:0] oData
    );
    reg [6:0]tData ;
    assign oData = tData;
    always@(*)
    begin 
        case(iData)
             4'b0000: tData=7'b1000000;
                       
                     4'b0001: tData=7'b1111001;
                   
                     4'b0010: tData=7'b0100100;
                       
                     4'b0011: tData=7'b0110000;
                       
                     4'b0100: tData=7'b0011001;
                       
                     4'b0101: tData=7'b0010010;
                       
                     4'b0110: tData=7'b0000010;
                       
                     4'b0111: tData=7'b1111000;
                       
                     4'b1000: tData=7'b0000000;
                       
                     4'b1001: tData=7'b0010000;
                       
    
                    
                    default: tData=7'b1111111;
          endcase
    end
    
    
endmodule
