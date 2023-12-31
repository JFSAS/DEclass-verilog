`timescale 1ns/1ps
`include "mod60_sec.v"
`include "mod60_min.v"
`include "mod12_hour.v"
//时间计数器产生模块
//需要sec，min，hour三个输出
//输入有clk，rst
module digital_data(
    input                  clk    ,        // 时钟信号
    input                  rst_n  ,        // 复位信号
    output   [3:0]      sec_1    ,        // 秒1
    output   [3:0]      sec_2    ,        // 秒2
    output   [3:0]      min_1    ,        // 分1
    output   [3:0]      min_2    ,        // 分2
    output   [3:0]      hour_1   ,        // 时1
    output   [3:0]      hour_2          // 时2

);
    wire oc_1;
    wire oc_2;
    mod60_sec _sec(.clk(clk),.rst_n(rst_n),.sec_1(sec_1),.sec_2(sec_2),.oc(oc_1));
    mod60_min _min(.clk(clk),.en(oc_1),.rst_n(rst_n),.min_1(min_1),.min_2(min_2),.oc(oc_2));
    mod12_hour _hour(.clk(clk),.en(oc_2),.rst_n(rst_n),.hour_1(hour_1),.hour_2(hour_2));
endmodule