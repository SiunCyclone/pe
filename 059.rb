def encrypt
	open("files/59/cipher1.txt") do |f|
		ary = f.read.split(",").map(&:to_i)
		analyze(ary, "aaa")
	end
end

def analyze(ary, key)
	keyAry = key.bytes
	words = ""

	ary.each_slice(3) do |three_ary|
		3.times do |i|
			break if three_ary.size <= i
			words += (three_ary[i] ^ keyAry[i]).chr
		end
	end

	if check(words) > 76.0
		p check(words)
		p key
		p words
		p sum(words)
	else
		p key
		analyze(ary, next_key(key))
	end
end

def sum(words)
	words.bytes.inject(:+)
end

def check(words)
	words = words.split(//)

	num = words.length
	cnt = 0
	words.each do |x|
		if ("a".."z").member?(x) || ("A".."Z").member?(x)
			cnt += 1
		end
	end

	cnt/num.to_f * 100
end

def next_key(key)
	if key[2] != "z"
		key[2] = key[2].succ
	elsif key[1] != "z"
		key[1] = key[1].succ
		key[2] = "a"
	elsif key[0] != "z"
		key[0] = key[0].succ
		key[1] = "a"
		key[2] = "a"
	end
	return key
end

encrypt

