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

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1

    half = arr.length / 2 
    half =- 1 if arr.length.even?

    left_arr = merge_sort(arr[0...half])
    right_arr = merge_sort(arr[half..-1])
    # p left_arr
    # p right_arr

    # return left_arr + right_arr
    
     return merge(left_arr,right_arr)
    


    # if left_arr.length == 1 && right_arr.length == 1
    #     if left_arr[0] > right_arr[0]
    #         return left_arr + right_arr
    #     else
    #         return right_arr + left_arr
    #     end
    # elsif left_arr.length == 1 && right_arr.length == 0
    #     return left_arr[0]
    # end
end

def merge(arr_one,arr_two)
    finArr = []
    while arr_one.length != 0 && arr_two.length != 0
        
        if arr_one[0] < arr_two[0]
            finArr << arr_one.shift
        else
            finArr << arr_two.shift
        end
    end
    finArr << arr_one
    finArr << arr_two
    finArr.flatten
end

p merge_sort([38,27,43,3,8,82,10])

# p merge([2,6],[5,7])

def subsets(array)
    return [[]]if array.length == 0 
    return [[]] << array if array.length == 1
    new_arr = []

    subsets(array[0...-1]).each do |ele| 
        new_arr << (ele << array[-1])
    end
    return subsets(array[0...-1])  + new_arr
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]