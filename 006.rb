p (1..100).inject(&:+)**2 - (1..100).inject{|a, b| a + b**2 }

