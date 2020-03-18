module OmegaCore

include("util.jl")              # Utilities
include("namedtuple.jl")        # Named tuple utilities

include("ctx.jl")               # Context

include("tags.jl")              # Tags
include("rng.jl")               # Random number generation

include("id.jl")                # IDs
include("space.jl")             # Sample/Paramter Spaces
include("sample.jl")            # Variables
include("ciid.jl")              # Conditional Independence
include("var.jl")               # Variable

include("primparam.jl")         # Primitive Parameters
include("distributions.jl")         # Primitive Parameters
include("omega.jl")             # Sample Space / Distributions

include("intervene.jl")         # Causal interventions
include("cassette.jl")
include("causal.jl")

include("condition.jl")         # Conditioning variables

include("rejection.jl")         # Rejection sampling Inference

include("dispatch.jl")          # Primitive Distributions

include("pointwise.jl")         # Syntactic sugar


# Left to implement:
# automatic id                 
# Static ids                   
# Memoization                  
# argmax                       
# memoization                  
# Get gradients working zygote 
# rand                         
# Replica exchange             
# HMC                          
# Spec automatic testing       
# Metropolis hastings          
# interact with soft predicates
# Type stability               
# working intervene            
# conditioning                 



end