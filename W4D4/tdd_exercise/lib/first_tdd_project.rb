def my_uniq(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.keys
end


def two_sum(arr)
    indices = []
    
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |i2|
            indices << [i, i2] if arr[i] + arr[i2] == 0
        end
    end
    indices
end

def my_transpose(arr)
    transposed = []
    arr.each_with_index do |row, i|
        new_row = []
        row.each_with_index do |col, j|
            new_row << arr[j][i]
        end
        transposed << new_row
    end
    transposed
end

def stock_picker(arr)
    biggest_difference = 0
    indices = []

    (0...arr.length).each do |i|
        (i...arr.length).each do |i2|
            if arr[i2] - arr[i] > biggest_difference
                biggest_difference = arr[i2] - arr[i]
                indices = [i, i2]
            end 
        end
    end
    indices
end
