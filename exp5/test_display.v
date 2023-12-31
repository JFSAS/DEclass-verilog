`timescale 1ns/1ps
`include "digital_display.v"
module test_display();
    reg clk;
    reg rst_n;
    wire [5:0] an;
    wire [7:0] sseg;
    reg [3:0] hex0;
    reg [3:0] hex1;
    reg [3:0] hex2;
    reg [3:0] hex3;
    reg [3:0] hex4;
    reg [3:0] hex5;
    digital_display _digital_display(.clk(clk),.rst_n(rst_n),.hex0(hex0),.hex1(hex1),.hex2(hex2),.hex3(hex3),.hex4(hex4),.hex5(hex5),.an(an),.sseg(sseg));
    initial 
        begin
            clk = 0;
            forever begin
                clk = ~clk;
                #5;
            end 
        end
    initial
        begin
            rst_n = 0;
            #1000;
            rst_n = 1;
            #1000;
            $finish;
        end
    initial 
        begin 
            $dumpfile("test_display.vcd");
            $dumpvars(0,test_display);
        end

endmodule