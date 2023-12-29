`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/25 15:13:23
// Design Name: 
// Module Name: DATCOMPARE_8
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


module DATCOMPARE_8(
	input [7:0] iData_a,
	input [7:0] iData_b,
	output [2:0] oData
    );
	 
	 wire [3:0] iData_a_l;
	 wire [3:0] iData_a_h;
	 wire [3:0] iData_b_l;
	 wire [3:0] iData_b_h;
	 wire [2:0] oData_1;
	 
	 assign iData_a_l=iData_a[3:0];
	 assign iData_a_h=iData_a[7:4];
	 assign iData_b_l=iData_b[3:0];
	 assign iData_b_h=iData_b[7:4];
	 
	DataCompare4 DataCompare_l(iData_a_l,iData_b_l,3'b000,oData_1);
	DataCompare4 DataCompare_h(iData_a_h,iData_b_h,oData_1,oData);

endmodule
