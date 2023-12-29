`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/26 09:51:23
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input CLK,
    input rst_n,
    output [2:0] oQ,
    output [6:0] oDisplay
    );
    wire Q0,Q1,Q2,tmp;
    wire [3:0] display;
    reg [24:0] rt;
    wire f1;
    always @(posedge CLK,negedge rst_n) 
        begin
            if(!rst_n) 
                rt <=0; 
            else rt <= rt+1;
        end
    assign f1 = rt[24];
    JK JK_1(.CLK(f1),.J(1'b1),.K(1'b1),.rst_n(rst_n),.Q(Q0));
    JK JK_2(.CLK(f1),.J(Q0),.K(Q0),.rst_n(rst_n),.Q(Q1));
    assign tmp = (Q0&Q1);
    JK JK_3(.CLK(f1),.J(tmp),.K(tmp),.rst_n(rst_n),.Q(Q2));
    assign display[0] = Q0;
    assign display[1] = Q1;
    assign display[2] = Q2;
    assign display[3] = 1'b0;
    assign oQ = display;
    display7 _display7(.iData(display),.oData(oDisplay));
endmodule

    
