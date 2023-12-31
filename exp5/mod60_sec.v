`timescale 1ns/1ps
//模60计数器秒
module mod60_sec(
    input               clk    ,        // 时钟信号
    input               rst_n  ,        // 复位信号
    output reg  [3:0]   sec_1    ,        // 个位
    output reg  [3:0]   sec_2    ,        // 十位
    output reg            oc               // 进位信号
);
    always@(posedge clk) 
        begin
            if(rst_n==0) 
                begin
                    sec_1<=4'b0000;
                    sec_2<=4'b0000;
                end
            else 
                begin
                    if(sec_1==4'b1001) 
                        begin
                            sec_1<=4'b0000;
                            if(sec_2==4'b0101) 
                                begin
                                    sec_2<=4'b0000;
                                    oc<=1'b1;
                                end
                            else 
                                begin
                                sec_2<=sec_2+1;
                                oc<=1'b0;
                                end
                        end
                    else 
                        begin
                        sec_1<=sec_1+1;
                        oc<=1'b0;
                        end
                end 
        end
endmodule