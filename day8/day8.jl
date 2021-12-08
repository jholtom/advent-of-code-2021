# Part 1
input = readlines("input.txt")
output = split.(map(x -> x[2][2:end], split.(input, "|")),' ')
counts = map(x -> length.(x), output);
c = findall.(x -> (x == 2 || x == 3 || x == 4 || x == 7), counts);
println(length(collect(Iterators.flatten(c))))

# Part 2
signals = split.(map(x -> x[1][1:end-1], split.(input, "|")),' ');
SEGMENTS = Dict(
  0 => "abcefg",
  1 => "cf",
  2 => "acdeg",
  3 => "acdfg",
  4 => "bcdf",
  5 => "abdfg",
  6 => "abdefg",
  7 => "acf",
  8 => "abcdefg",
  9 => "abcdfg")
p2 = 0;
for k in 1:length(signals)
    # Deduce mapping for signal s and count output o and add to p2
    s = signals[k]; # Grab signal associated
    o = output[k]; # Grab output associated
    nums = ["" for i in 0:9];
    nums[2] = s[findall(x -> length(x) == 2, s)][1];
    nums[5] = s[findall(x -> length(x) == 4, s)][1];
    nums[8] = s[findall(x -> length(x) == 3, s)][1];
    nums[9] = s[findall(x -> length(x) == 7, s)][1];
    nums[7] = s[findall(x -> (length(x) == 6 && length(intersect!(split(x,""), split(nums[8],""))) == 2),s)][1];
    nums[10] = s[findall(x -> (length(x) == 6 && length(intersect!(split(x,""), split(nums[5],""))) == 4),s)][1];
    nums[1] = s[findall(x -> (length(x) == 6 && length(intersect!(split(x,""), split(nums[8],""))) == 3 && length(intersect!(split(x,""), split(nums[5],""))) == 3),s)][1];
    nums[6] = s[findall(x -> (length(x) == 5 && length(intersect!(split(x,""), split(nums[8],""))) == 2 && length(intersect!(split(x,""), split(nums[5],""))) == 3),s)][1];
    nums[3] = s[findall(x -> (length(x) == 5 && length(intersect!(split(x,""), split(nums[8],""))) == 2 && length(intersect!(split(x,""), split(nums[5],""))) == 2),s)][1];
    nums[4] = s[findall(x -> (length(x) == 5 && length(intersect!(split(x,""), split(nums[8],""))) == 3),s)][1];
    outnum = map(x -> findall(y -> sort(collect(x)) == sort(collect(y)), nums).-1, o)
    global p2 += parse(Int, join(string.(collect(Iterators.flatten(outnum)))));
end
println(p2);
