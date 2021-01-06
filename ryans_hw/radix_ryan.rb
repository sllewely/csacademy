
array = Array.new(24){rand(999)}
puts array

def radix_sort(arr)

    arr.max.to_s.length.times do |i|
        buckets = Hash.new {[]}
        arr.each do |number|
            digit = number.to_s[-i-1]
            if digit == nil
                buckets[0] = buckets[0] << number
            else 
                buckets[digit.to_i] = buckets[digit.to_i] << number
            end
        end
        sorted_arr = []
        10.times do |digit|
            sorted_arr.concat(buckets[digit])
        end
        arr = sorted_arr
    end
    p arr
    
end

radix_sort(array)