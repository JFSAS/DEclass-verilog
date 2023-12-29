`timescale 1ns / 1ps
`include "FA.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 16:00:00
// Design Name: 
// Module Name: adder
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


module adder(
    input [7:0] iData_a,
    input [7:0] iData_b,
    input iC,
    output [7:0] oData,
    output oData_C
    );
    FA FA_1(iData_a[0],iData_b[0],iC,o_0,oData[0]);
    FA FA_2(iData_a[1],iData_b[1],o_0,o_1,oData[1]);
    FA FA_3(iData_a[2],iData_b[2],o_1,o_2,oData[2]);
    FA FA_4(iData_a[3],iData_b[3],o_2,o_3,oData[3]);
    FA FA_5(iData_a[4],iData_b[4],o_3,o_4,oData[4]);
    FA FA_6(iData_a[5],iData_b[5],o_4,o_5,oData[5]);
    FA FA_7(iData_a[6],iData_b[6],o_5,o_6,oData[6]);
    FA FA_8(iData_a[7],iData_b[7],o_6,oData_C,oData[7]);
    
    
endmodule
