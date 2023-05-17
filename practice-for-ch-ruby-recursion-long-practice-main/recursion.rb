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


class Array
    def deep_dup
        return [] if self.length == 0
        return [self[0]] if !(self[0].is_a?(Array)) && self.length == 1
        return [self[0]] + self[1..-1].deep_dup if !(self[0].is_a?(Array))
        return [self[0].deep_dup] + self[1..-1].deep_dup
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# shouldn't modify robot_parts

robot_parts_copy[1] << "LEDs"
# but it does
# p robot_parts_copy
p robot_parts_copy[1]
p robot_parts[1]

# arr = [[1,2],[3,5],[[6]]]
# arr_two = arr.deep_dup
# arr_two[1] << 4

# p arr
# p arr_two
