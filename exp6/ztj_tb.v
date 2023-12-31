`timescale 1ns/1ps
module ztj_tb;
    reg clk,sw;
    wire [3:0] data;
    reg res_n;
    led u_led(clk,data,sw,res_n);
    initial
        begin
            clk = 0;
            forever  
                begin 
                    #5
                    clk = ~clk;
                end
        end
    initial
        begin
            res_n = 0;
            sw = 0;
            #1000 ;
            res_n = 1;
            sw = 1;
            #1000 ;
            sw = 0;
            $finish;
        end
    initial 
        begin 
            $dumpfile("ztj.vcd");
            $dumpvars(0,ztj_tb);
        end
endmodule