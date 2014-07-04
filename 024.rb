ary = (1..10).to_a
$re,$bef = [],0
def jun(num,ary)
  return $re.join if ary.empty?
  sh = $bef
  ary.size.times do |i|
    $bef = sh
    sh += (1..ary.size-1).inject(&:*)
    if sh>=num
      $re << ary.delete_at(i)-1
      break
    end
  end
  $re << ary.pop-1 if ary.size==1
  jun(num,ary)
end

puts jun(1000000,ary)
