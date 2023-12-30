//counter的仿真激励文件
`timescale 1ns / 1ps
module counter_tb;
    reg CLK=0,rst_n=1;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    counter counter_1(.CLK(CLK),.rst_n(rst_n),.oQ(oQ),.oDisplay(oDisplay));
    integer i = 0;
    initial
        begin
            forever
            begin
                
                #1000000000;
                CLK=~CLK;
                $display("%d : %b",i,oQ);
                i= i+1;
            end
        end

endmodule
