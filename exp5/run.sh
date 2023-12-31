iverilog -o tv.vvp tb.v top.v
vvp tv.vvp
mv tb.vcd /Users/fangzizhuo
cd /Users/fangzizhuo
gtkwave tb.vcd