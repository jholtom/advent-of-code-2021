# Part 1
input = readline("input.txt");
pos = split.(input, ',');
pos = map(x -> parse(Int, x), pos);
minval = Inf;
for i = range(minimum(pos),maximum(pos))
	val = sum(abs.(pos .- i));
	if val < minval
		global minval = val;
	end
end
println(minval);

# Part 2
minval = Inf;
for i = range(minimum(pos),maximum(pos))
    val = sum(sum.(range.(1,abs.(pos .- i))));
	if val < minval
		global minval = val;
	end
end
println(minval);
