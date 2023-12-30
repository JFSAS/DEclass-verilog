//counter的仿真激励文件
`timescale 1ns / 1ps
module counter_tb;
    reg CLK=0,rst_n=1;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    counter counter_1(.CLK(CLK),.rst_n(rst_n),.oQ(oQ),.oDisplay(oDisplay));
    integer i = 0;
    reg [31:0] cnt = 0;
    reg f1;
    
    initial 
        begin
            for (i=0;i<10;i=i+1)
                begin
                    CLK = ~CLK;
                    cnt = cnt +1;
                    #100;
                    $display("cnt=%d, output = %d,CLK = %d,odisplay = %d",cnt,oQ,CLK,oDisplay);
                end
                
        end
    

endmodule
