require "first_tdd_project"
require "tower_of_hanoi"

describe "#my_uniq" do
    it "returns an array" do
        arr = [1, 2, 3]
        expect(my_uniq(arr).is_a?(Array)).to eq(true)
    end

    it "removes duplicate elements" do
        arr = [1, 1, 2, 2, 3, 3]
        expect(my_uniq(arr)).to eq([1, 2, 3])
    end

    it "doesn\'t remove non-duplicated items" do
        arr = [1, 2, 3]
        expect(my_uniq(arr)).to eq([1, 2, 3])
    end
end

describe "#two_sum" do 
    it "returns a 2D array of the indices of elements that sum to zero" do
        arr = [-1, 0, 2, -2, 1]
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end

    it "returns elements in the correct order" do
        arr = [-1, 0, 2, -2, 1]
        expect(two_sum(arr)[0][0]).to be < two_sum(arr)[1][0]
    end

    it "returns an array" do
        arr = [1, 2, 3]
        expect(two_sum(arr).is_a?(Array)).to eq(true)
    end

    it "returns an empty array if no elements sum to zero" do
        arr = [1, 2, 3]
        expect(two_sum(arr)).to eq([])
    end
end

describe "#my_transpose" do
    it "switches rows and columns" do
        rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
        ]
        expect(my_transpose(rows)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end

describe "#stock_picker" do
    it "returns an array" do
        arr = [1, 2, 3]
        expect(stock_picker(arr).is_a?(Array)).to eq(true)
    end
    it "makes sure you\'re not selling before buying" do
        arr = [5, 6, 8, 2, 3]
        expect(stock_picker(arr)[0]).to be < stock_picker(arr)[1]
    end
    it "makes sure you\'re returning the biggest difference" do
        arr = [5, 6, 8, 2, 3]
        expect(stock_picker(arr)).to eq([0, 2])
    end

    it "makes sure to pick the first days" do
        arr = [5, 2, 4, 6, 8]
        expect(stock_picker(arr)).to eq([1, 4])
    end
end

describe TowerofHanoi do
    new_game = TowerofHanoi.new(3)
    before(:each) { new_game.move([1, 2]) }
    it "moves a piece from one stack to another" do
        expect(new_game.start_arr).to eq([2, 3])
        expect(new_game.target1).to eq([1])
    end

    it "will raise error if first array is empty" do
        expect{ new_game.move([3, 2])}.to raise_error(ArgumentError)
    end

    context "already made one move" do
        before(:each) { new_game.move([1, 3]) }
        before(:each) { new_game.move([1, 2]) }

        it "will keep the stacks the same if the larger number is put on a smaller one" do
            expect(new_game.start_arr).to eq([3])
            expect(new_game.target1).to eq([1])
        end
    end



end