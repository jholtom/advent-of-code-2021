# Part 1
input = readline("input.txt");
ages = split.(input, ',');
ages = map(x -> parse(Int, x), ages);
ndays = 80;
n_new = 0;
ζ = [];
for i in range(1,ndays)
    global ages = ages .- 1; # Subtract 1 from all fish
    append!(ages, 8*ones(Int, n_new));
    global ages[ζ] .= 6;
    global ζ = findall(x -> x == 0, ages); # Find the elements that are time to reproduce
    global n_new = length(ζ);
end
p1 = length(ages);
print(p1)

# Part 2
