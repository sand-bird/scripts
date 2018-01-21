#!/usr/bin/env ruby

if !ARGV.size.between?(2, 4) then
  puts "Error: wrong number of arguments"
  exit(false)
end

var = ARGV[0].to_f
mean = ARGV[1].to_f
=begin
if ARGV.size == 2 then
  x = rand(1..100)
elsif ARGV.size == 3 then
  x = rand(1..Integer(ARGV[2]))
else
  x = rand(Integer(ARGV[2])..Integer(ARGV[3]))
end
=end
x = ARGV[2].to_f

puts "x: #{x}"
puts "sigma (st. dev.): #{var}"
puts "mu (mean): #{mean}"

a = ((1-mean)/var**2 - 1/mean) * mean**2
b = a * (1/mean - 1)

p = x**(a-1) * (1-x)**(b-1)

puts "a: #{a}"
puts "b: #{b}"
puts "p: #{p}"

=begin
exp_top = - ((x - mu) ** 2)
exp_bottom = (2 * sigma ** 2)
exp = exp_top / exp_bottom
base = 1 / (sigma * 2.5)

puts "base: #{base}"
puts "exp_top: #{exp_top}"
puts "exp_bottom: #{exp_bottom}"
puts "exp: #{exp}"
puts "result: #{base * Math::E ** exp}"


def normal(n, mean, var, min = 0, max = 1)
{
  dmin = mean - min
  dmax = max - mean

  if (dmin <= 0 || dmax <= 0) then
    exit("mean must be between min = #{min} and max = #{max}")
  end

  if (var >= dmin * dmax) then
    exit("var must be less than (mean - min) * (max - mean) = #{dmin * dmax}")
  end

  # mean and variance of the standard beta distributed variable
  mx = (mean - min) / (max - min)
  vx = var / (max - min)^2

  # find the corresponding alpha-beta parameterization
  a = ((1 - mx) / vx - 1 / mx) * mx^2
  b = a * (1 / mx - 1)

  # generate standard beta observations and transform
  x <- normal(n, a, b)
  y <- (max - min) * x + min

  return(y)
}

set.seed(1)

n <- 10000
y <- rgbeta(n, mean = 1, var = 4, min = -4, max = 5)
=end
