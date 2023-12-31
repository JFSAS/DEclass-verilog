`timescale 1ns/1ps
module led(clk,data,sw,res_n);
    input clk,sw;
    output[3:0] data;
    input res_n;
    reg clk_o;
    parameter max=1;
    reg[1:0] state=2'b00;
    reg[30:0] n;
    reg[3:0] data;
    always @(posedge clk)begin
        if(res_n==0)begin
            n<=0;
            data<=0;
            state<=2'b00;
            clk_o<=0;
        end
        else
        if(n==max)begin
            clk_o = ~clk_o;
            n<=0;
        end
        else n<=n+1;
    end
    always @(posedge clk_o)
        begin 
            case(state)
            2'b00:begin
                state<=2'b01;
                if(sw)
                    begin 
                        data<= 4'b1000;
                    end
                    else begin 
                        data<= 4'b0001;
                    end
            end
            2'b01:begin
                state<=2'b10;
                if(sw)
                    begin 
                        data<=4'b0100;
                    end
                    else
                    begin 
                        data<=4'b0010;
                    end
            end
            2'b10:begin
                state<=2'b00;
                if(sw)
                    begin 
                        data<=4'b0010;
                    end
                    else begin 
                        data<=4'b0100;
                    end
            end
            2'b11:begin
                state<=2'b00;
                if(sw)
                    begin 
                        data<=4'b0001;
                    end
                    else begin 
                        data<=4'b1000;
                    end
            end
            endcase
        end

endmodule

