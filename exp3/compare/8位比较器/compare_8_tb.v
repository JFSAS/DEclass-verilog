//测试激励文件
// Design Name : compare_8_tb
`timescale 1ps/1ps
module testbench;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;
    compare_8 uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData)
    );
    reg [2:0] expected_value;
    task run_test;
        input [7:0] iData_a;
        input [7:0] iData_b;
        begin
            iData_a = iData_a;
            iData_b = iData_b;
            expected_value = expected_value;
            #10;
            if (oData != expected_value) 
                $display("Test failed: expected %b, got %b", expected_value, oData);
            else
                case (oData)
                    3'b100: $display("%b great than %b", iData_a, iData_b);
                    3'b010: $display("%b less than %b", iData_a, iData_b);
                    3'b001: $display("%b equal %b", iData_a, iData_b);
                    default: $display("Error");
            endcase
        end
        
    endtask
    initial begin
        iData_a = 8'b00000000;
        iData_b = 8'b00000000;
        expected_value = 3'b001;
        #10;
        run_test(iData_a, iData_b);
        iData_a = 8'b00000001;
        iData_b = 8'b00000010;
        expected_value = 3'b010;
        #10;
        run_test(iData_a, iData_b);
        iData_a = 8'b00000010;
        iData_b = 8'b00000001;
        expected_value = 3'b100;
        #10;
        run_test(iData_a, iData_b);
        iData_a = 8'b00000001;
        iData_b = 8'b00000001;
        expected_value = 3'b001;
        #10;
        run_test(iData_a, iData_b); 
    end
endmodule