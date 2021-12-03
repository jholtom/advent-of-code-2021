input = readlines("input.txt");
# Part 1
m1 = split.(input,"")
m = [parse.(Int, a) for a in m1];
m = m[:,:];
sz = size(m);
γ = (round.(sum(m)/sz[1]));
ϵ = abs.(round.(1 .- sum(m)/sz[1]));
γ = parse(Int, join(string.(Int.(γ))); base=2);
ϵ = parse(Int, join(string.(Int.(ϵ))); base=2);
p = ϵ*γ
println(p)
# Part 2
# Want to find dominant in first column, then filter m, then repeat
m2 = transpose(reduce(hcat, m));
oxy = [];
while size(m2)[1] != 1
    ρ = round.(sum(m2[:,1])/size(m2)[1], RoundNearestTiesUp);
    global m2 = m2[m2[:,1] .== (ρ),2:end];
    push!(oxy, ρ);
end
if size(m2)[2] != 0
    append!(oxy, m3);
end
oxy = parse(Int, join(string.(Int.(oxy))); base=2);
co2 = [];
m3 = transpose(reduce(hcat, m));
while size(m3)[1] != 1
    ρ = abs.(round.(1 .- sum(m3[:,1])/size(m3)[1]));
    global m3 = m3[m3[:,1] .== (ρ),2:end];
    push!(co2, ρ);
end
if size(m3)[2] != 0
    append!(co2, m3);
end
co2 = parse(Int, join(string.(Int.(co2))); base=2);
p2 = oxy*co2
println(p2)
