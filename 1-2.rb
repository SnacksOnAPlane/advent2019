require 'pry'

$masses = []
$totals = []

File.readlines("1-1.data").each do |line|
  $masses << line.to_i
end

# $masses = [14, 1969, 100756]

$initial_fuels = $masses.map { |m| (m / 3) - 2 }
puts $initial_fuels

$totals = $initial_fuels.map do |f|
  puts "mapping #{f}"
  total_amt = f
  amt = f
  loop do
    amt = (amt / 3) - 2
    break if amt <= 0
    puts "adding #{amt} to #{total_amt}"
    total_amt += amt
  end
  puts "returning #{total_amt}"
  total_amt
end
puts $totals

puts $totals.sum
