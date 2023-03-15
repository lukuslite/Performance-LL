export sequence_of_three, alternate_items

function sequence_of_three(start)
    out = Float64[]
    push!(out, start, start+1, start+2)
    return out
end

function alternate_items(nrepeats::Integer, item1, item2)
    doubled = 2*nrepeats
    if typeof(item1) != typeof(missing) && typeof(item2) != typeof(missing)
        out = zeros(Int64,doubled)
        out[1:2:doubled] .= item1
        out[2:2:doubled] .= item2
    else
        out = zeros(Union{Missing,Int64},doubled)
        out[1:2:doubled] .= item1
        out[2:2:doubled] .= item2
    end
    return out
end
