input = readlines("input.txt")
points = split.(input,' ')
floor = zeros(1000,1000);
for i in points
    start = parse.(Int,split(i[1],','))
    term = parse.(Int,split(i[3],','))
    if start[1] == term[1] || start[2] == term[2] # If x1=x2 or y1=y2 only
        if start[1] > term[1]
            floor[term[1]+1:start[1]+1,start[2]+1:term[2]+1] = floor[term[1]+1:start[1]+1,start[2]+1:term[2]+1] .+ 1;
        elseif start[2] > term[2]
            floor[start[1]+1:term[1]+1,term[2]+1:start[2]+1] = floor[start[1]+1:term[1]+1,term[2]+1:start[2]+1] .+ 1;
        else
            floor[start[1]+1:term[1]+1,start[2]+1:term[2]+1] = floor[start[1]+1:term[1]+1,start[2]+1:term[2]+1] .+ 1;
        end
    end
end
p1 = length(findall(x->x>=2, floor))
println(p1)
