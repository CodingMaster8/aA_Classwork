class TowerofHanoi
    attr_accessor :num, :start_arr, :target1, :target2
    def initialize(num)
        @num = num
        @start_arr = (1..num).to_a
        @target1 = []
        @target2 = []
        @num_moves = 0
    end

    def get_input
        puts "Put the number you want to take from and the number you want to place on in the format '1 1'"
        input = gets.chomp.split(" ").map(&:to_i)
        if !input.all? { |index| index.between?(1, 3) }
            puts "Invalid move"
            get_input
        end
        move(input)
    end

    def move(input)

        case
        when input[0] == 1
            if input[1] == 2 && (target1.empty? || target1[0] > start_arr[0])
                target1.unshift(start_arr.shift)
            elsif input[1] == 3 && (target2.empty? || target2[0] > start_arr[0])
                target2.unshift(start_arr.shift)
            end
        when input[0] == 2
            if input[1] == 1 && (start_arr.empty? || start_arr[0] > target1[0])
                start_arr.unshift(target1.shift)
            elsif input[1] == 3 && (target2.empty? || target2[0] > target1[0])
                target2.unshift(target1.shift)
            end
        when input[0] == 3
            if input[1] == 1 && (start_arr.empty? || start_arr[0] > target2[0])
                start_arr.unshift(target2.shift)
            elsif input[1] == 2 && (target1.empty? || target1[0] > target2[0])
                target1.unshift(target2.shift)
            end
        end
        # if !won?
        #     get_input
        # end
    end

    def won?
        p start_arr
        p target1
        p target2
        if target1 == (1..num).to_a || target2 == (1..num).to_a
            puts "You won!!!"
            return true
        end
        false
    end

end

# new_game = TowerofHanoi.new(3)
# new_game.move


#cant be bigger on smaller
#moves into correct aray
#starting array is empty?
