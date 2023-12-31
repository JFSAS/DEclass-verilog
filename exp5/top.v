`timescale 1ns/1ps
`include "digitial_data.v"
`include "digitial_display.v"
`include "digitial_divider.v"
//数码管时钟显示top模块
module top(
    input clk,
    input rst_n,
    input [1:0] contral,
    output [5:0] an,
    output [7:0] sseg
);  
    wire [3:0] sec_1;
    wire [3:0] sec_2;
    wire [3:0] min_1;
    wire [3:0] min_2;
    wire [3:0] hour_1;
    wire [3:0] hour_2;
    wire o_clk;
    digitial_data _digitial_data(.clk(o_clk),.rst_n(rst_n),.sec_1(sec_1),.sec_2(sec_2),.min_1(min_1),.min_2(min_2),.hour_1(hour_1),.hour_2(hour_2));
    digitial_display _digitial_display(.clk(o_clk),rst_n(rst_n),hex0(sec_1),hex1(sec_2),hex2(min_1),hex3(min_2),hex4(hour_1),hex5(hour_2),an,sseg);
    digitial_divider _digitial_divider(.clk(clk),.o_clk(o_clk),.contral(contral));
endmodule