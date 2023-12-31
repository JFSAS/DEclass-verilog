//counter的仿真激励文件
`timescale 1ns / 1ps
module counter_tb;
    reg CLK=0,rst_n=1;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    wire f1;
    counter counter_1(.CLK(CLK),.rst_n(rst_n),.oQ(oQ),.oDisplay(oDisplay),.f1(f1));
    initial 
        begin 
            CLK = 0;
            forever 
                begin
                    #10;
                    CLK = ~CLK;
                end
        end
    initial 
        begin
            rst_n = 1;
            #10;
            rst_n = 0;
            #10;
            rst_n = 1;
            #5000;
            $finish;
        end
    initial
        begin
            $dumpfile("counter.vcd");
            $dumpvars(0,counter_tb);
        end

endmodule
