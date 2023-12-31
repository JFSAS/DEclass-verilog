`timescale 1ns/1ps
module  testbench();
    reg clk;
    reg rst_n;
    reg [1:0] contral;
    wire [5:0] an;
    wire [7:0] sseg;


    wire o_clk;
    wire [3:0] sec_1;
    wire [3:0] sec_2;
    wire [3:0] min_1;
    wire [3:0] min_2;
    wire [3:0] hour_1;
    wire [3:0] hour_2;


    top _top(.clk(clk),.rst_n(rst_n),.contral(contral),.an(an),.sseg(sseg),.o_clk(o_clk),.sec_1(sec_1),.sec_2(sec_2),.min_1(min_1),.min_2(min_2),.hour_1(hour_1),.hour_2(hour_2));
    initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    initial
        begin
            contral = 0;
            rst_n = 0;
            #1000
            rst_n = 1;
            #100000 contral = 1;
            #100000 contral = 2;
            #100000 contral = 3;
            #100000 $finish;
        end
    initial 
        begin 
            $dumpfile("tb.vcd");
            $dumpvars(0,testbench);
        end
endmodule