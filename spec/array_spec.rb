require 'rspec'
require 'spec_helper'

describe 'class Array' do
  describe "#my_each" do
    it 'calls block once for each element in self (an array), passing that element to the block as a parameter' do
      accumulator = Array.new
      [1, 2, 3, 4, 5, 6].my_each { |element| accumulator << (element * 2) }
      expect(accumulator).to eq([2, 4, 6, 8, 10, 12])
    end
  end

  describe "#my_each" do
    it 'if no block is given an Enumerator of the array is returned' do
      accumulator = Array.new
      enum = [1, 2, 3, 4, 5, 6].my_each
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      expect(accumulator).to eq([1, 2, 3, 4, 5, 6])
    end
  end

  describe "#my_each_with_index" do
    it 'calls block once for each element in self (an array), passing that element and its index to the block as parameters' do
      accumulator = Array.new
      [1, 2, 3, 4, 5, 6].my_each_with_index { |element, index| accumulator[index] = (element * 2) }
      expect(accumulator).to eq([2, 4, 6, 8, 10, 12])
    end
  end

  describe "#my_each_with_index" do
    it 'if no block is given an Enumerator of the array is returned' do
      accumulator = Array.new
      enum = [1, 2, 3, 4, 5, 6].my_each
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      expect(accumulator).to eq([1, 2, 3, 4, 5, 6])
    end
  end
end
