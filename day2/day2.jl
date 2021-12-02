input = readlines("input.txt");
# Part 1
k = split.(input," ");
depth = 0
horz = 0
for i in k
    if i[1] == "forward"
        global horz += parse(Int, i[2])
    elseif i[1] == "down"
        global depth += parse(Int, i[2])
    elseif i[1] == "up"
        global depth -= parse(Int, i[2])
    end
end
p = horz*depth
println(p)
# Part 2
depth = 0
horz = 0
aim = 0
for i in k
    if i[1] == "forward"
        global horz += parse(Int, i[2])
        global depth += aim*parse(Int, i[2])
    elseif i[1] == "down"
        global aim += parse(Int, i[2])
    elseif i[1] == "up"
        global aim -= parse(Int, i[2])
    end
end
p2 = horz*depth
println(p2)
