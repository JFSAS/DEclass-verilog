`timescale 1ns / 1ps
`include "JK.v"
`include "display7.v"

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
    wire Q0;//初始化
    wire Q1,Q2;
    wire [3:0] display=0;
    reg [24:0] rt=0;
    wire f1;
    wire [1:0] temp1;
    wire [1:0] temp2;
    always @( posedge CLK,negedge rst_n) 
        begin
            
            if(!rst_n) 
                rt <=0; 
            else rt <= rt+1;
            #10;
            $display("counter : CLK=%d,rst_n=%d,rt = %b,f1 = %b,oq=%d,Q0=%b",CLK,rst_n,rt,f1,oQ,Q0);
        end
    assign f1 = rt[0];
    //对实例化的JK进行初始化reg oQ=0;


    JK _JK_FF0(.CLK(f1),.rst_n(rst_n),.J(1'b1),.K(1'b1),.Q(Q0));
    assign temp1[0]=Q0;
    assign temp1[1]=Q0;
    JK _JK_FF1(.CLK(f1),.rst_n(rst_n),.J(temp1[1]),.K(temp1[0]),.Q(Q1));
    assign temp2[0]=(Q0&Q1);
    assign temp2[1]=(Q0&Q1);
    JK _JK_FF2(.CLK(f1),.rst_n(rst_n),.J(temp2[1]),.K(temp2[0]),.Q(Q2));
    assign display[0] = Q0;
    assign display[1] = Q1;
    assign display[2] = Q2;
    assign display[3] = 1'b0;
    assign oQ = display;
    display7 _display7(.iData(display),.oData(oDisplay));
endmodule

    
