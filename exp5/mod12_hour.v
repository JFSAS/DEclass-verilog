`timescale 1ns/1ps
module mod12_hour(
    input            clk    ,        // 时钟信号
    input             en     ,        // 使能信号
    input             rst_n  ,        // 复位信号
    output reg  [3:0] hour_1    ,        // 个位
    output reg  [3:0] hour_2            // 十位    
);
    always@(posedge clk)
        begin
            if(rst_n == 0)
                begin
                    hour_1 <= 4'b0000;
                    hour_2 <= 4'b0000;
                end
        end
    always@(posedge en) 
        begin 
            if(hour_1 == 4'b1001) 
                begin
                    hour_1 <= 4'b0000;
                    if(hour_2 == 4'b0001) 
                        begin
                            hour_2 <= 4'b0000;
                        end
                    else 
                        begin
                            hour_2 <= 4'b0001;
                        end
                end
            else 
                begin
                    hour_1 <= hour_1 + 1;
                end
        end
endmodule