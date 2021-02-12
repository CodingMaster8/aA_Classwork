#my_min
#Given a list of integers find the smallest number in the list.

def my_min(list)
  list.each_with_index do |num1, idx1|
    smallest = true 
    
    list.each_with_index do |num2, idx2|
      next if idx1 == idx2 
      smallest = false if list[idx2] < list[idx1]
    end

    return num1 if smallest == true 
  end
end



def my_min(list)
  smallest = list[0]

  list.each { |num| smallest = num if num < smallest }

  smallest 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


#Largest Contiguous Sub-sum
#You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

def largest_contiguous_sub_sum(list)
  sum = 0
  subs2 = sub_sets(list)
  subs2
  subs2.each do |sub_arr|
    if sub_arr.sum > sum 
      sum = sub_arr.sum 
    end
  end

  sum
end

def sub_sets(array)
  return [[]] if array.empty?
  subs = largest_contiguous_sub_sum(array[0...-1])
  
  subs.concat(subs.map { |sub| sub + [array.last] })

end



list = [5, 3, -7]
p largest_contiguous_sub_sum(list) # => 8

  # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7


# list = [2, 3, -6, 7, -6, 7]
# largest_contiguous_sub_sum(list) # => 8 (from [7, -6, 7])