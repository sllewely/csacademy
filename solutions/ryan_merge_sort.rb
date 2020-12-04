b = [2, 1, 3, 4, 6, 5, 1, 6, 1, 5, 4, 6, 2, 6, 7, 1, 3, 8, 2, 1, 6, 2, 4, 5, 3]
a = [2, 1, 3, 4, 6]
require "pry"
def divide_and_conquer(arr)
   if arr.length <= 1
    return arr
   else
    mid_point = arr.length/2
    left_half = divide_and_conquer(arr[0,mid_point])
    right_half = divide_and_conquer(arr[mid_point, mid_point+1])
    merge_sort(left_half, right_half)
   end
end

def merge_sort(left_half, right_half)
    sorted_arr = []
    until left_half.empty? && right_half.empty?
        if left_half.empty? || right_half.empty?
            sorted_arr.concat(right_half)
            sorted_arr.concat(left_half)
            break
        end

        if left_half.first <= right_half.first 
            sorted_arr << left_half.shift
        elsif left_half.first > right_half.first
            sorted_arr << right_half.shift
        end
    end
    return sorted_arr
end

p divide_and_conquer(b)




