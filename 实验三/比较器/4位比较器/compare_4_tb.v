`timescale 1ns / 1ps


module testbench;
       reg [3:0] iData_a;
    reg [3:0] iData_b;
    reg [2:0] iData; 
    wire [2:0] oData; 

    // 实例化设计
    compare_4 uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .iData(iData),
        .oData(oData)
    );

    reg [2:0] expected_value; 

    task run_test;
        input [3:0] iData_a;
        input [3:0] iData_b;
        input [2:0] iData;
        input [2:0] expected_value;

        begin
            iData_a = iData_a;
            iData_b = iData_b;
            iData = iData;
            expected_value = expected_value;
            #10;
            case (oData)
                3'b100: $display("%b great than %b", iData_a, iData_b);
                3'b010: $display("%b less than %b", iData_a, iData_b);
                3'b001: $display("%b equal %b", iData_a, iData_b);
                default: $display("Error");
            endcase
        end
    endtask
    // 初始化激励
    initial begin
        
        iData_a = 4'b0000;
        iData_b = 4'b0000;
        iData = 3'b000;
        expected_value = 3'b001;  
        #10; // 等待 10 时间单位
        run_test(iData_a, iData_b, iData, expected_value);

        iData_a = 4'b0001;
        iData_b = 4'b0010;
        iData = 3'b001;
        expected_value = 3'b010;  
        #10;
        run_test(iData_a, iData_b, iData, expected_value);
        iData_a = 4'b0010;
        iData_b = 4'b0001;
        iData = 3'b010;
        expected_value = 3'b100;
        #10;
        run_test(iData_a, iData_b, iData, expected_value);

        
    end

    // 检查输出
    always @(posedge iData) begin
        
        if (oData != expected_value) begin
            $display("Test failed: expected %b, got %b", expected_value, oData);
        end
    end
endmodule