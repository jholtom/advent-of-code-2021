input = readlines("input.txt")
points = split.(input,' ')
# Part 1
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

# Part 2
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
    else # The diagonal case
        if start[1] > term[1] && start[2] > term[2]
            x = start[1]:-1:term[1];
            y = start[2]:-1:term[2];
        elseif start[1] > term[1]
            x = start[1]:-1:term[1];
            y = start[2]:term[2];
        elseif start[2] > term[2]
            x = start[1]:term[1];
            y = start[2]:-1:term[2];
        else
            x = start[1]:term[1];
            y = start[2]:term[2];
        end
        for i = 1:length(x)
            floor[x[i]+1,y[i]+1] = floor[x[i]+1,y[i]+1] + 1;
        end
    end
end
p2 = length(findall(x->x>=2, floor))
println(p2)
#for i in 1:size(floor,1)
#for j in 1:size(floor,2)
#        if floor[j,i] == 0
#            print(".")
#        else
#            print(Int(floor[j,i]))
#        end
#    end
#    println();
#end
