require 'pry'

$masses = []

File.readlines("1-1.data").each do |line|
  $masses << line.to_i
end

puts $masses.map { |m| (m / 3) - 2 }.sum()
