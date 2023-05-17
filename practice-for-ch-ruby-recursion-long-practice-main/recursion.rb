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
# p robot_parts_copy[1]
# p robot_parts[1]

# arr = [[1,2],[3,5],[[6]]]
# arr_two = arr.deep_dup
# arr_two[1] << 4

# p arr
# p arr_two

def fibs(n)
    return 0 if n ==1 
    return 1 if n == 2
    fibs(n - 1) + fibs(n - 2)
end 

def bsearch(array,target)
    return nil if array.length == 1 && array[0] != target
    return 0 if array.length == 1
    mid = array.length / 2 
    return mid if target == array[mid]

    less_array = array[0..mid - 1]
    greater_array = array[mid + 1..-1]
    if target < array[mid]
       return bsearch(less_array,target)
    else 
       return nil if bsearch(greater_array,target) == nil
       return less_array.length + 1 + bsearch(greater_array,target) 
    end

end 

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

