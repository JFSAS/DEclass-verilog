iverilog -o ztj.vvp ztj.v ztj_tb.v
vvp ztj.vvp
mv ztj.vcd /Users/fangzizhuo
cd /Users/fangzizhuo
gtkwave ztj.vcd