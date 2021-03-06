
# const ID = Int
const VectorID = Vector{Int}

@inline append(a::Vector{T}, b::Vector{T}) where T = vcat(a, b)
@inline append(a::Vector{T}, b::T) where T = @show vcat(a, T[b])
@inline singletonid(::Type{Vector{T}}, i::Vararg{T, N}) where {T, N} = T[i...]
# @inline firstelem(::Vector{T}) where T = zero(T)
# function increment(a::Vector)
#   b = copy(a)
#   b[end] += 1
#   b
# end`