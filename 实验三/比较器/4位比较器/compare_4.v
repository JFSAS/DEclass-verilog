`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/19 10:07:48
// Design Name: 
// Module Name: compare_4
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


module compare_4(
    input [3:0] iData_a,
    input [3:0] iData_b,
    input [2:0] iData,
    output [2:0] oData
    );
    reg [2:0] oData;
   
    always @ (*)
        begin
            if (iData == 0) 
            begin 
                oData[0] = (iData_a > iData_b);
                oData[1] = (iData_a == iData_b);
                oData[2] = (iData_a < iData_b);
            end
            else oData = iData;
            
        end
    
    
   
             
        
endmodule
