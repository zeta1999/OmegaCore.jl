export defΩ, SimpleΩ, LazyΩ

using ..IDS, ..Util, ..Tagging
using Distributions: Distribution
using Random: AbstractRNG

"Simplest, immutable Omega"
struct SimpleΩ{TAGS <: Tags, T} <: AbstractΩ
  data::T
  tags::TAGS
end
``
SimpleΩ(data) = SimpleΩ(data, Tags())
replacetags(ω::SimpleΩ, tags) = SimpleΩ(ω.data, tags)
(T::Type{<:Distribution})(π::SimpleΩ, args...) = ω.data[scope(ω)]

recurse(d::D, ω::SimpleΩ) where {D<:Distribution} = getindex(ω.data, scope(ω))::eltype(D)

traithastag(t::Type{SimpleΩ{TAGS, T}}, tag) where {TAGS, T} = traithastag(TAGS, tag)
traits(::Type{SimpleΩ{TAGS, T}}) where {TAGS, T} = traits(TAGS)
