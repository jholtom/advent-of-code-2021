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
println(p1)

# Part 2
ages = split.(input, ',');
ages = map(x -> parse(Int, x), ages);
ndays = 256;
bins = zeros(9); # Bins for ages 0 to 8
map(x -> bins[x+1] += 1, ages); # Initialize the fish in each bin
for i in range(1,ndays)
    global bins = circshift(bins,-1);
    global bins[7] = bins[7] + bins[end];
end
p2 = sum(bins);
println(p2);
