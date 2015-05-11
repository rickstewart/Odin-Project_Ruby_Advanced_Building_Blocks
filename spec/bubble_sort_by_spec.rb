require 'rspec'
require 'spec_helper'

describe 'class BubbleSortBy' do
  before :all do
    @bubble_sort_by = BubbleSortBy.new
  end
  describe '#bubble_sort_by' do
    it 'should sort an array of positive integers' do
      expect(@bubble_sort_by.bubble_sort_by([7, 3, 4, 5, 9, 1, 2, 0])).to eq([0, 1, 2, 3, 4, 5, 7, 9])
    end
    it 'should sort an array of positive and negative integers' do
     expect(@bubble_sort_by.bubble_sort_by([7, 3, 4, -5, 9, 1, 2, 0])).to eq([-5, 0, 1, 2, 3, 4, 7, 9])
    end
    it 'should sort an array of positive and negative integers with duplicate negative values' do
      expect(@bubble_sort_by.bubble_sort_by([7, 3, -4, -4, 9, 1, 2, 0])).to eq([-4, -4, 0, 1, 2, 3, 7, 9])
    end
    it 'should sort an array of positive and negative integers with duplicate positive values' do
      expect(@bubble_sort_by.bubble_sort_by([7, 3, 4, 4, 9, 1, 2, 0])).to eq([0, 1, 2, 3, 4, 4, 7, 9])
    end
    it 'should sort the values passed as arguments according to sort method passed in as a block' do
      expect(@bubble_sort_by.bubble_sort_by(['hi', 'hello', 'hey']) do |left, right|
               right.length - left.length
             end).to eq(['hi', 'hey', 'hello'])
    end
  end
end
