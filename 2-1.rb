require 'pry'

$data = []

File.readlines("1-1.data").each do |line|
  $data << line.to_i
end

$data = [1,0,0,0,99]

def gpos(i)
  $data[i]
end

pos = 0
do
  code = $data[pos]
  if (code == 1)
    $data[gpos(pos+3)] = $data[gpos(pos+1)] + $data[gpos(pos+2)]
  elsif (code == 2)
    $data[gpos(pos+3)] = $data[gpos(pos+1)] * $data[gpos(pos+2)]
  elsif (code == 99)
    break
  end
end

puts $data
