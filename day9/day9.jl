input = readlines("input.txt");
heightmap = transpose(reduce(hcat, map(x -> parse.(Int, x), split.(input,""))));
# Part 1
using LocalFilters;
minmap = erode(heightmap, 3);
overlap = heightmap[findall(minmap .== heightmap)];
println(sum(overlap)+length(overlap));

# Part 2
using Images;
using StatsBase;
labels = label_components(heightmap .!= 9)
cnts = counts(labels[labels .!= 0]);
top3 = sort(cnts)[end-2:end]
println(prod(top3));
