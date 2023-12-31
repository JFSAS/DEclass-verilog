`timescale 1ns/1ps
//模60计数器分
module mod60_min(
    input            clk    ,        // 时钟信号
    input             en     ,        // 使能信号
    input             rst_n  ,        // 复位信号
    output reg  [3:0] min_1    ,        // 个位
    output reg  [3:0] min_2    ,        // 十位    
    output reg     oc               // 进位信号
);
    always@(posedge clk)
        begin
            if(rst_n == 0)
                begin
                    min_1 <= 4'b0000;
                    min_2 <= 4'b0000;
                end
        end
    always@(posedge en) 
        begin 
            if(min_1 == 4'b1001) 
                begin
                    min_1 <= 4'b0000;
                    if(min_2 ==4'b0101) 
                        begin
                            min_2 <= 4'b000;
                            oc <= 1'b1;
                        end
                    else 
                        begin
                            min_2 <= min_2 + 1;
                            oc <= 1'b0;
                        end
                end
            else 
                begin
                    min_1 <= min_1 + 1;
                    oc <= 1'b0;
                end
                
        end
endmodule