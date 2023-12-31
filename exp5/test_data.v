`timescale 1ns/1ps
module testbench;
    reg clk;
    reg rst_n;
    wire  [3:0] sec_1;
    wire [3:0] sec_2;
    wire [3:0] min_1;
    wire [3:0] min_2;
    wire [3:0] hour_1;
    wire [3:0] hour_2;

    digital_data _digital_data(.clk(clk),.rst_n(rst_n),.sec_1(sec_1),.sec_2(sec_2),.min_1(min_1),.min_2(min_2),.hour_1(hour_1),.hour_2(hour_2));

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
            #10;
            rst_n = 1;
            #1000000;
            $finish;
        end
    initial
        begin 
            $dumpfile("test_data.vcd");
            $dumpvars(0,testbench);
        end
endmodule