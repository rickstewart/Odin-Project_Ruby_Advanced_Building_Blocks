require 'rspec'
require 'spec_helper'

describe 'class Array' do
  before :all do
    @an_array = [1,2,3,4,5,6]
  end
  describe "#my_each" do
    it 'should call the given block once for each element in self, passing that element as a parameter' do
      expect(@an_array.my_each {|element| print (element * 2).to_s + ', '}).to eq('2, 4, 6, 8, 10, 12, ')
    end
    # describe "#my_each_with_index" do
    #   it 'should sort an array of positive integers' do
    #     expect(@bubble_sort.bubble_sort([7, 3, 4, 5, 9, 1, 2, 0])).to eq([0, 1, 2, 3, 4, 5, 7, 9])
    #   end
    #
    #   true.should == false
    # end
  end
end
