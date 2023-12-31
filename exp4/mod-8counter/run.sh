#!/bin/bash
iverilog -o counter.vvp counter.v counter_tb.v
vvp counter.vvp
mv counter.vcd /Users/fangzizhuo
cd /Users/fangzizhuo
gtkwave counter.vcd