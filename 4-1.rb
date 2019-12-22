require 'pry'
require 'set'

$range = 172851..675869
$poss = []

def same_adjacent(n)
  str_n = n.to_s
  (0..(str_n.length-2)).each do |pos|
    pair = str_n[pos..(pos+1)]
    return true if pair[0] == pair[1]
  end
  false
end

def never_decrease(n)
  str_n = n.to_s
  last_digit = 0
  str_n.each_char do |digit|
    return false if digit.to_i < last_digit
    last_digit = digit.to_i
  end
  true
end

$range.each do |n|
  next unless same_adjacent(n)
  next unless never_decrease(n)
  $poss << n
end

puts $poss.length