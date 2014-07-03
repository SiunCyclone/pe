f = ->(a, b, c=0) { if a > 4000000 then p c; break end; c += a if a%2==0; f[b, a+b, c] }; f[1, 2]
