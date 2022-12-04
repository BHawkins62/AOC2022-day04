# Day 4
# written in Julia

# Part One

open("input.txt") do file
    subset_pairs = 0
    while !eof(file)        
        assigned1, assigned2 = [], []
        line = readline(file)
        pair1_start, pair1_end, pair2_start, pair2_end = split(line,('-',','))
        for i in (parse(Int,pair1_start)):(parse(Int,pair1_end))
            push!(assigned1, i) 
        end
        for i in (parse(Int,pair2_start)):(parse(Int,pair2_end))
            push!(assigned2, i) 
        end
        if (issubset(assigned1, assigned2) || issubset(assigned2, assigned1))
            subset_pairs += 1
        end
    end
    println("Number of assignment pairs; where one range fully contain the other:  $subset_pairs")
end

# Part Two

open("input.txt") do file
    overlaps = 0
    while !eof(file)        
        assigned1, assigned2 = [], []
        line = readline(file)
        pair1_start, pair1_end, pair2_start, pair2_end = split(line,('-',','))
        for i in (parse(Int,pair1_start)):(parse(Int,pair1_end))
            push!(assigned1, i) 
        end
        for i in (parse(Int,pair2_start)):(parse(Int,pair2_end))
            push!(assigned2, i)  
        end
        for item in assigned1
            if (item in assigned2)
                overlaps += 1
                break
            end
        end
    end
    println("Number of assignment pairs where the ranges overlap :  $overlaps")
end