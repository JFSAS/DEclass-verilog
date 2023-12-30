`timescale 1ns/1ps
module counter_tb;
    reg CLK;
    reg rst_n;
    wire [6:0] odisplay;
    reg [1:0] contral;
    reg [3:0] load_counter;
    wire [3:0] oQ;
    reg  load_enable;
    wire o_CLK;
    counter_10 counter_10_1(.CLK(CLK),.contral(contral),.rst_n(rst_n),.load_enable(load_enable),.load_counter(load_counter),.odisplay(odisplay),.oQ(oQ),.o_CLK(o_CLK));
    initial 
        begin 
            CLK = 0;
            forever 
                begin
                    #10;
                    CLK = ~CLK;
                end
        end
    initial begin
        rst_n = 1;
        #500;
        rst_n = 1;


    end
    initial 
        begin
            $display("%t ->start", $time);
            load_enable = 0;
            load_counter = 4'b0000;
            contral = 2'b00;
            #100;
            load_enable = 1;
            load_counter = 1;
            $display("%t ->load_enable = %b,load_counter = %b", $time,load_enable,load_counter);
            #100;
            load_enable = 0;
            #3000;
            contral = 2'b01;
            #300;
            contral = 2'b10;
            #300;
            contral = 2'b11;
            #30000000;
            $display("%t ->finish", $time);
            $finish;                
        end
    initial
        begin
            $dumpfile("counter_10_tb.vcd");
            $dumpvars(0,counter_tb);
        end
endmodule