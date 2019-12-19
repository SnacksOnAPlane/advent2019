require 'pry'

$data = []

def restore_data
  File.readlines("2-1.data").each do |line|
    $data = line.split(',').map(&:to_i)
  end
end

#$data = [2,4,4,5,99,0]

def gpos(i)
  $data[i]
end

def calculate
  pos = 0
  loop do
    code = $data[pos]
    if (code == 1)
      $data[gpos(pos+3)] = $data[gpos(pos+1)] + $data[gpos(pos+2)]
    elsif (code == 2)
      $data[gpos(pos+3)] = $data[gpos(pos+1)] * $data[gpos(pos+2)]
    elsif (code == 99)
      break
    end
    pos += 4
  end
  $data[0]
end

(0..99).each do |noun|
  (0..99).each do |verb|
    puts "#{noun} #{verb}"
    restore_data
    $data[1] = noun
    $data[2] = verb
    val = calculate
    puts val
    exit() if val == 19690720
  end
end
