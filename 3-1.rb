require 'pry'
require 'set'

def calc_path(moves)
  path = []
  x = 0
  y = 0
  moves.each do |m|
    puts m
    dir = m[0]
    num = m[1..-1].to_i

    if dir == 'R'
      path += (x..x + num).map { |nx| [nx, y] }
    elsif dir == 'L'
      path += x.downto(x - num).map { |nx| [nx, y] }
    elsif dir == 'U'
      path += (y..y + num).map { |ny| [x, ny] }
    elsif dir == 'D'
      path += y.downto(y - num).map { |ny| [x, ny] }
    end

    x = path.last[0]
    y = path.last[1]
    puts "end at #{x} #{y}"
  end

  path
end

$data = File.readlines("3-1.data")

#$data = ["R8,U5,L5,D3",
#         "U7,R6,D4,L4"]
#$data = ["R75,D30,R83,U83,L12,D49,R71,U7,L72",
#"U62,R66,U55,R34,D71,R55,D58,R83"]

$w1_path = calc_path($data[0].split(','))
$w2_path = calc_path($data[1].split(','))

def disp(path)
  puts path.map { |p| "[#{p[0]},#{p[1]}]" }.join(',')
end

disp $w1_path
disp $w2_path

crosses = Set.new($w1_path) & $w2_path
crosses.delete([0,0])

puts crosses.map { |c| c[0].abs + c[1].abs }.min

puts crosses

