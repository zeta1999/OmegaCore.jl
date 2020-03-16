using OmegaCore, Distributions
using Test

function test_pos_measure()
  x(ω) = Normal(ω, 0, 1)
  y(ω) = x(ω) > 0
  x_cond = x |ᶜ y
  sample(x_cond, RejectionSample)
end

function test_out_of_order_condition()
  x = 1 ~ Poisson(1.3)
  function f(ω)
    n = x(ω)
    x = 0.0
    for i = 1:n
      x += (i + 1) ~ Normal(0, 1)(ω)
    end
    x
  end

  f_ = f | (x ==ₚ 3.0)
  g_ = ω -> (x(ω), f_(ω))
end

function test_parent()
  μ = 1 ~ Normal(0, 1)
  x = 2 ~ Normal(μ, 1)
  x_ = 0.123
  μ_ = 0.1
  μ | x = x_
  ω = defΩ()((1,) -> μ_)
  @test logpdf(μ_, ω) = logpdf(Normal(0, 1), μ_) + logpdf(Normal(μ_, 1), x_)
end

# We can use an intervention in this case
# In order to do the conditioning in eed to b eabel to replace the value
# as well as intercept the application
# I'll need some notion of equivalence
# 