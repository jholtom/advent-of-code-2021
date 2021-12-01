input = parse.(Int, readlines("input.txt"));
# Part 1
y = diff(input);
k = sum(>=(0),y)
println(k)
# Part 2
using RollingFunctions;
z = rolling(sum, input, 3)
k2 = sum(>(0), diff(z));
println(k2)
