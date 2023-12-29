`timescale 1ns / 1ps
module testbench;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    reg iC;
    wire [7:0] oData;
    wire oData_C;
    adder uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .iC(iC),
        .oData(oData),
        .oData_C(oData_C)
    );
    reg [7:0] expected_value;
    reg expected_value_C;
    task printoutput;
        begin
            $display("%b+%b+%b=%b%b", iData_a, iData_b, iC, oData_C,oData);
        end
    endtask
    task test_output;
        begin
            if(oData!=expected_value )
                $display(" oData Test failed: expected %b, got %b", expected_value, oData);
            else
                 printoutput();
            if(oData_C!=expected_value_C )
                $display(" oData_C Test failed: expected %b, got %b", expected_value_C, oData_C);
            else
                 printoutput();
        end
    endtask
    initial 
        begin
            iData_a = 8'b00000010;
            iData_b = 8'b00000001;
            iC = 1'b0;
            expected_value = 8'b00000011;
            expected_value_C = 1'b0;
            #10;
            test_output();
            iData_a = 8'b00100010;
            iData_b = 8'b00100001;
            iC = 1'b1;
            expected_value = 8'b01000100;
            expected_value_C = 1'b0;
            #10;
            test_output();
            iData_a = 8'b10000010;
            iData_b = 8'b10000000;
            iC = 1'b1;
            expected_value = 8'b00000011;
            expected_value_C = 1'b1;
            #10;
            test_output();

        end
endmodule