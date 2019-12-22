require 'pry'
require 'set'

$range = 172851..675869
$poss = []

def two_adjacent(n)
  puts n
  str_n = n.to_s
  # https://stackoverflow.com/questions/35186708/how-to-split-a-string-of-repeated-characters-with-uneven-amounts-ruby
  chunks = str_n.chars.chunk(&:itself).map{|x|x.last.join}
  chunks.any? { |c| c.length == 2 }
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
  next unless two_adjacent(n)
  next unless never_decrease(n)
  $poss << n
end

puts $poss.length