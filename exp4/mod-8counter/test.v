`timescale 1ns / 1ps//时间单位为1s，精确到ps
module test;
    reg CLK;
    integer i=0;
    //生成vcd文件
    initial
        begin
            $dumpfile("test.vcd");
            $dumpvars(0,test);
        end
    initial 
        begin 
            CLK = 0;
        $display("first");
        #5000000000;//延时5s
        $display("second");
        end

endmodule