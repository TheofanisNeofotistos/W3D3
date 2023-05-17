def range(s,e)
    return [] if e <= s
    [s] + range(s + 1 , e)
end

# p range(1,5)

def exp(b,n)
    return 1 if n == 0 
    b * exp(b,n-1)
end

def exp_two(b,n)
    return 1 if n == 0 
    return b if n == 1

    if n.even? 
       return exp(b,n/2) ** 2 
    end

    if n.odd?
        return b * (exp(b, (n - 1) / 2) ** 2) 
    end
end

# p exp(11,590)