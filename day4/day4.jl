call_order = readlines("test_call_order.txt");
println(call_order);
using CSV;
using DataFrames;
boards = CSV.read("test_input.txt", DataFrame; delim=' ', ignorerepeated=true, header=0);
println(boards);
# Part 1
# This was so slow and frustrating I switched to MATLAB :(