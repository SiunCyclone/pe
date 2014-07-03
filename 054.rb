#2013/3/8
#***

def main
	count = 0
	open("files/54/poker.txt") do |f|
		f.each do |line|
			p1 = check(line.split(" ").slice(0..4))
			p2 = check(line.split(" ").slice(5..9))

			if p1[2] > p2[2]
				count += 1
			elsif p1[2] == p2[2]
				count += 1 if p1[1] > p2[1]
			end
		end
	end
	p count
end

def check(cards)
	cards = modify(cards)
	nums_str = cards.map{|x| x[/[0-9]+/]}
	suits_str = cards.map{|x| x[/[A-Z]+/]}
	card_model = (2..14).to_a.map(&:to_s)
	suit = cards[0][/[A-Z]+/]

	max = nums_str.map(&:to_i).max
	if suits_str.uniq.length == 1
		return ["royal_flash", max, 10] if nums_str.sort == ["10", "11", "12", "13", "14"]
		return ["straight_flash", max, 9] if straight(nums_str, card_model)
	end

	if nums_str.uniq.length == 2
		s = nums_str.count(nums_str[0])

		max = repet_num(4, nums_str).max
		return ["four_card", max, 8] if (s == 1 || s == 4)

		max = repet_num(3, nums_str).max
		return ["full_house", max, 7] 
	end

	max = nums_str.map(&:to_i).max
	return ["flash", max, 6] if suits_str.uniq.length == 1
	return ["straight", max, 5] if straight(nums_str, card_model)

	if nums_str.uniq.length == 3
		s = nums_str.count(nums_str[0])

		max = repet_num(3, nums_str).max
		return ["three_card", max, 4] if max != nil

		max = repet_num(2, nums_str).max
		return ["two_pair", max, 3]
	end

	max = repet_num(2, nums_str).max
	return ["one_pair", max, 2] if nums_str.uniq.length == 4

	max = nums_str.map(&:to_i).max
	return ["none", max, 1]
end

def repet_num(n, ary)
	list = []	
	ary.each do |x|
		if (ary.count(x) == n) && (list.member?(x) == false)
			list << x
		end
	end
	return list.map(&:to_i)
end

def modify(cards)
	return cards.map do |x|
		case x[0]
			when "T"
				x = "10" + x[1]
			when "J"
				x = "11" + x[1]
			when "Q"
				x = "12" + x[1]
			when "K"
				x = "13" + x[1]
			when "A"
				x = "14" + x[1]
			else
				x
		end
	end
end

def straight(nums_str, card_model)
	nums = nums_str.map(&:to_i).sort
	(0..nums.length-2).each do |i|
		return false if nums[i]+1 != nums[i+1]
	end
	return true
end

main
