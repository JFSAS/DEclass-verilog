`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 10:52:05
// Design Name: 
// Module Name: divider
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


module divider(
    input [1:0] contral,
    input CLK,
    output o_CLK
    );
    reg o_CLK_1 = 1'b0;
    
    assign o_CLK = o_CLK_1;
    reg [25:0] cnt = 0;
    always@(posedge CLK) 
       begin;
            cnt = cnt+1 ;
           case(contral) 
                2'b00 : 
                    begin 
                        if(cnt[0]==1) 
                            o_CLK_1 =1;
                        else
                            o_CLK_1 = 0; 
                    end
                2'b01 :
                    begin 
                        if(cnt[23]==1)
                            o_CLK_1 = 1;
                        else
                            o_CLK_1 = 0;
                    end
                2'b10:
                    begin
                        if(cnt[21] == 1)
                            o_CLK_1 = 1; 
                        else
                            o_CLK_1 = 0;
                    end
                2'b11:
                    begin
                        if(cnt[10] == 1)
                            o_CLK_1 = 1 ;
                        else
                            o_CLK_1 = 0;
                    end
               default :
                        o_CLK_1 = 0;
            endcase
       end
endmodule
