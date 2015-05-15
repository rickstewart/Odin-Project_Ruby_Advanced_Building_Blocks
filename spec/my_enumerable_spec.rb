require 'rspec'
require 'spec_helper'

describe 'module Enumerable' do
  describe "#my_select" do
    it 'returns an array containing all elements of self (an Array) for which the given block returns a true value.' do
      result = [1, 2, 3, 4, 5, 6, 7].my_select { |value| value % 2 == 0 }
      expect(result).to eq([2, 4, 6])
    end
  end

  describe "#my_select" do
    it 'if no block is given, an Enumerator of the Array is returned instead.' do
      results = Array.new
      enum = [1, 2, 3, 4, 5].my_select
      results << enum.next
      results << enum.next
      results << enum.next
      results << enum.next
      results << enum.next
      expect(results).to eq([1, 2, 3, 4, 5])
    end
  end

  describe "#my_select" do
    it 'returns a hash containing all elements of self (a Hash) for which the given block returns a true value.' do
      result = {one: 1, two: 2, three: 3, four: 4}.my_select { |key, value| value % 2 == 0 }
      expect(result).to eq({:two => 2, :four => 4})
    end
  end

  describe "#my_select" do
    it 'if no block is given, an Enumerator of the Hash is returned instead.'
    accumulator = Array.new
    enum = {one: 1,two: 2, three: 3,four: 4}.my_each
    accumulator << enum.next
    accumulator << enum.next
    accumulator << enum.next
    accumulator << enum.next
    accumulator = accumulator.to_h
    puts accumulator
    expect(accumulator).to eq({:one=>1, :two=>2, :three=>3, :four=>4})
  end
end
