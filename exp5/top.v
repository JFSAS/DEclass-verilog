`timescale 1ns/1ps
`include "digital_data.v"
`include "digital_display.v"
`include "digital_divider.v"
//数码管时钟显示top模块
module top(
    input clk,
    input rst_n,
    input [1:0] contral,
    output [5:0] an,
    output [7:0] sseg,



    output o_clk,
    output [3:0] sec_1,
    output [3:0] sec_2,
    output [3:0] min_1,
    output [3:0] min_2,
    output [3:0] hour_1,
    output [3:0] hour_2
    
);  

    wire [3:0] hex0; //第一个数码管显示的数字，以此类推
    wire [3:0] hex1;
    wire [3:0] hex2;
    wire [3:0] hex3;
    wire [3:0] hex4;
    wire [3:0] hex5;
    assign hex0 = sec_1;
    assign hex1 = sec_2;
    assign hex2 = min_1;
    assign hex3 = min_2;
    assign hex4 = hour_1;
    assign hex5 = hour_2;
    digital_data _digital_data(.clk(o_clk),.rst_n(rst_n),.sec_1(sec_1),.sec_2(sec_2),.min_1(min_1),.min_2(min_2),.hour_1(hour_1),.hour_2(hour_2));
    digital_display _digital_display(.clk(clk),.rst_n(rst_n),.hex0(hex0),.hex1(hex1),.hex2(hex2),.hex3(hex3),.hex4(hex4),.hex5(hex5),.an(an),.sseg(sseg));
    digital_divider _digital_divider(.clk(clk),.o_clk(o_clk),.contral(contral));
endmodule