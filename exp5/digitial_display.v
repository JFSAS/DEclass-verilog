`timescale 1ns/1ps
 //数码管显示模块
module digital_tube_display(
   input clk,
   input rst_n,
   input [3:0] hex0, //第一个数码管显示的数字
   input [3:0] hex1,
   input [3:0] hex2,
   input [3:0] hex3,
   input [3:0] hex4,
   input [3:0] hex5,
   output reg [5:0] an,   //数码管选择
   output reg [7:0] sseg  //共阴极数码管信号
   );
   reg [3:0] hex_in; //进入的数字
   localparam N = 17;//数码管分频
   reg [N-1:0] regN; 
   
   
   always@(posedge clk)
   begin
   		regN <= regN + 1'b1;
   		if (regN[N-1:N-3] == 3'b110) regN[N-1:N-3] <= 3'b000;//跳过110，111的情况
   end

   always@ *
   begin
   	case(regN[N-1:N-3])//使用分频信号的高三位作为数码管选择信号
   	3'b000:begin
   		an = 6'b111110; //选中第1个数码管
   		hex_in = hex0; //数码管显示的数字由hex_in控制，显示hex0输入的数字；
   		sseg[7] =0;
   	end
   	3'b001:begin
   		an = 6'b111101; //选中第2个数码管，以此类推
   		hex_in = hex1;
   		sseg[7] =0;
   	end
   	3'b010:begin
   		an = 6'b111011;
   		hex_in = hex2;
   		sseg[7] =1;//这里需要设置小数点
   	end
   	3'b011: begin
   		an = 6'b110111;
   		hex_in = hex3;
   		sseg[7] =0;
   	end
   	3'b100: begin
   		an = 6'b101111;
   		hex_in = hex4;
   		sseg[7] =1;//这里需要设置小数点
   	end
   	3'b101: begin
   		an = 6'b011111;
   		hex_in = hex5;
   		sseg[7] =0;
   	end
   	default:begin
   		an = 6'b111111;
   		hex_in = 0;
   		sseg[7] =0;
   	end
   	endcase
   end
   always@ (*)
   begin
   	case(hex_in)
   		4'h0: sseg[6:0] = 7'b1111110; //共阴极数码管
   		4'h1: sseg[6:0] = 7'b0110000;
   		4'h2: sseg[6:0] = 7'b1101101;
   		4'h3: sseg[6:0] = 7'b1111001;
   		4'h4: sseg[6:0] = 7'b0110011;
   		4'h5: sseg[6:0] = 7'b1011011;
   		4'h6: sseg[6:0] = 7'b1011111;
   		4'h7: sseg[6:0] = 7'b1110000;
   		4'h8: sseg[6:0] = 7'b1111111;
   		4'h9: sseg[6:0] = 7'b1111011;
   		4'ha: sseg[6:0] = 7'b1110111;
   		4'hb: sseg[6:0] = 7'b0011111;
   		4'hc: sseg[6:0] = 7'b1001110;
   		4'hd: sseg[6:0] = 7'b0111101;
   		4'he: sseg[6:0] = 7'b1001111;
   		4'hf: sseg[6:0] = 7'b1000111;
   	endcase
   end
   
   

endmodule
