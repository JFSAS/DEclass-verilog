`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 10:52:05
// Design Name: 
// Module Name: digitial_divider
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


module digital_divider(
    input [1:0] contral,
    input clk,
    output o_clk
    );
    reg o_clk_1 = 1'b0;
    
    assign o_clk = o_clk_1;
    reg [25:0] cnt = 0;
    always@(posedge clk) 
       begin;
            cnt = cnt+1 ;
           case(contral) 
                2'b00 : 
                    begin 
                        if(cnt[4]==1) 
                            o_clk_1 =1;
                        else
                            o_clk_1 = 0; 
                    end
                2'b01 :
                    begin 
                        if(cnt[9]==1)
                            o_clk_1 = 1;
                        else
                            o_clk_1 = 0;
                    end
                2'b10:
                    begin
                        if(cnt[8] == 1)
                            o_clk_1 = 1; 
                        else
                            o_clk_1 = 0;
                    end
                2'b11:
                    begin
                        if(cnt[7] == 1)
                            o_clk_1 = 1 ;
                        else
                            o_clk_1 = 0;
                    end
               default :
                        o_clk_1 = 0;
            endcase
       end
endmodule
