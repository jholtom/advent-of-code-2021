# Part 1
input = readlines("test_input.txt")
output = split.(map(x -> x[2], split.(input, "|")),' ')
counts = map(x -> length.(x), output);
c = findall.(x -> (x == 2 || x == 3 || x == 4 || x == 7), counts);
println(length(collect(Iterators.flatten(c))))

# Part 2
