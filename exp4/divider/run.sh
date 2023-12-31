#编译并打开波形图
iverilog -o divider.vvp divider_tb.v divider.v
vvp divider.vvp
mv divider.vcd /Users/fangzizhuo
cd /Users/fangzizhuo
gtkwave divider.vcd 