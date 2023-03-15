export DefaultArray

# This implements an array that returns a "default" value when
# accessed out of bounds. Example:
#     a = DefaultArray([1.0, 2.0], NaN)
#     a[1]   # returns 1.0
#     a[5]   # returns NaN (does not throw a BoundsError)
# However, this is a deliberately "amateurish" implementation
# and it has numerous deficiencies.

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
# Hint: every aspect of the struct definition should be improved (not just the fields)
struct DefaultArray{N} <: AbstractArray{Any,N}
    parentarray::Vector{Int64}
    defaultvalue::Int64
end
DefaultArray(parentarray, defaultvalue) = DefaultArray{ndims(parentarray)}(parentarray::Vector{Int64}, defaultvalue::Int64)


Base.getindex(a::DefaultArray{N}, i::Vararg{Int,N}) where N = checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
Base.size(a::DefaultArray) = size(a.parentarray::Vector{Int64})
