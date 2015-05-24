require 'rspec'
require 'spec_helper'

describe 'module Enumerable' do

  describe "#my_select" do
    it 'should return an array containing all elements of self (an Array) for which the given block returns a true value.' do
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
    it 'should return a hash containing all elements of self (a Hash) for which the given block returns a true value.' do
      result = {one: 1, two: 2, three: 3, four: 4}.my_select { |key, value| value % 2 == 0 }
      expect(result).to eq({:two => 2, :four => 4})
    end
  end

  describe "#my_select" do
    it 'if no block is given, an Enumerator of the Hash is returned instead.' do
      answer = Array.new
      enum = {one: 1, two: 2, three: 3, four: 4}.my_each
      answer << enum.next
      answer << enum.next
      answer << enum.next
      answer << enum.next
      expect(answer).to eq([[:one, 1], [:two, 2], [:three, 3], [:four, 4]])
    end
  end

  describe "#my_all?" do
    it 'should return true when all members of the array evaluate as true in the block.' do
      returned = [2, 4, 6, 8, 10].my_all? { |value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_all?" do
    it 'should return false when one or more members of the array evaluate as false in the block.' do
      returned = [2, 4, 6, 8, 10, 11].my_all? { |value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_all?" do
    it 'should return true when none of the members of the array are false or nil, and no block was given.' do
      returned = [2, 4, 6, 8, 10, 11].my_all?
      expect(returned).to eq(true)
    end
  end

  describe "#my_all?" do
    it 'should return false when one or more members of the array are false or nil, and no block was given.' do
      returned = [2, nil, 6, 8, 10, 11].my_all?
      expect(returned).to eq(false)
    end
  end

  describe "#my_all?" do
    it 'should return true when all members of the hash evaluate as true in the block.' do
      returned = {two: 2, four: 4, six: 6, eight: 8, ten: 10}.my_all? { |key, value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_all?" do
    it 'should return false when one or more members of the hash evaluate as false in the block.' do
      returned = {two: 2, four: 4, six: 6, eight: 8, ten: 10, eleven: 11}.my_all? { |key, value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_all?" do
    it 'should return true when none of the members of the hash are false or nil, and no block was given.' do
      returned = {two: 2, four: 4, six: 6, eight: 8, ten: 10, eleven: 11}.my_all?
      expect(returned).to eq(true)
    end
  end

  describe "#my_all?" do
    it 'should return false when one or more members of the array are false or nil, and no block was given.' do
      returned = {two: 2, four: false, six: 6, eight: 8, ten: 10, eleven: 11}.my_all?
      expect(returned).to eq(false)
    end
  end

  describe "#my_any?" do
    it 'should return true if any members of the array evaluate as true in the block.' do
      returned = [1, 3, 5, 7, 9, 10].my_any? { |value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_any?" do
    it 'should return false if all members of the array evaluate as false in the block.' do
      returned = [1, 3, 5, 7, 9].my_any? { |value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_any?" do
    it 'should return true if any members of the array are true, and no block is given.' do
      returned = [1, false, 5, false, 9, nil].my_any?
      expect(returned).to eq(true)
    end
  end

  describe "#my_any?" do
    it 'should return false if all members of the array are false or nil, and no block is given.' do
      returned = [nil, nil, false, false, nil].my_any?
      expect(returned).to eq(false)
    end
  end

  describe "#my_any?" do
    it 'should return true if any members of the hash evaluate as true in the block.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, nine: 9, ten: 10}.my_any? { |key, value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_any?" do
    it 'should return false if all members of the hash evaluate as false in the block.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, nine: 9}.my_any? { |key, value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_any?" do
    it 'should return true if any members of the hash are true, and no block is given.' do
      returned = {one: nil, three: 3, five: nil, seven: false, nine: false}.my_any?
      expect(returned).to eq(true)
    end
  end

  describe "#my_any?" do
    it 'should return false if all members of the hash are false or nil, and no block is given.' do
      returned = {one: nil, three: nil, five: nil, seven: false, nine: false}.my_any?
      expect(returned).to eq(false)
    end
  end

  describe "#my_none?" do
    it 'should return true if none of the members of the array evaluate as true in the block.' do
      returned = [1, 3, 5, 7, 9].my_none? { |value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_none?" do
    it 'should return false if any of the members of the array evaluate as true in the block.' do
      returned = [1, 3, 5, 7, 8].my_none? { |value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_none?" do
    it 'should return true if none of the members of the array are true, and no block is given.' do
      returned = [nil, nil, false, false, false].my_none?
      expect(returned).to eq(true)
    end
  end

  describe "#my_none?" do
    it 'should return false if any of the members of the array are true, and no block is given.' do
      returned = [nil, nil, false, false, false, 5].my_none?
      expect(returned).to eq(false)
    end
  end

  describe "#my_none?" do
    it 'should return true if none of the members of the hash evaluate as true in the block.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, nine: 9}.my_none? { |key, value| value % 2 == 0 }
      expect(returned).to eq(true)
    end
  end

  describe "#my_none?" do
    it 'should return false if any of the members of the hash evaluate as true in the block.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, eight: 8}.my_none? { |key, value| value % 2 == 0 }
      expect(returned).to eq(false)
    end
  end

  describe "#my_none?" do
    it 'should return true if none of the members of the hash are true, and no block is given.' do
      returned = {one: nil, three: nil, five: nil, seven: false, nine: false}.my_none?
      expect(returned).to eq(true)
    end
  end

  describe "#my_none?" do
    it 'should return false if any of the members of the hash are true, and no block is given.' do
      returned = {one: nil, three: 3, five: nil, seven: false, nine: false}.my_none?
      expect(returned).to eq(false)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the array, no argument or block given.' do
      returned = [1, 2, 3, 4, 5, 6, 7].my_count
      expect(returned).to eq(7)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the array that are equal to the given argument, with no block given.' do
      returned = [1, 2, 3, 4, 5, 6, 7, 4].my_count(4)
      expect(returned).to eq(2)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the array that evaluate as true when passed to the block.' do
      returned = [1, 2, 3, 4, 5, 6, 7].my_count { |value| value % 2 == 0 }
      expect(returned).to eq(3)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the hash, no argument or block given.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, eight: 8}.my_count
      expect(returned).to eq(5)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the hash that are equal to the given argument, with no block given.' do
      returned = {one: 1, three: 3, five: 5, seven: 7, eight: 8}.my_count(7)
      expect(returned).to eq(1)
    end
  end

  describe "#my_count" do
    it 'should return the number of items in the hash that evaluate as true when passed to the block.' do
      returned = {one: 1, two: 2, three: 3, five: 5, seven: 7, eight: 8}.my_count { |key, value| value % 2 == 0 }
      expect(returned).to eq(2)
    end
  end

  describe "#my_map" do
    it 'should return a new array with the results of running the block once for every element in the original array.' do
      returned = [1, 2, 3, 4, 5, 6, 7].my_map { |value| value * 2 }
      expect(returned).to eq([2, 4, 6, 8, 10, 12, 14])
    end
  end

  describe "#my_map" do
    it 'if no block is given, an Enumerator of the Array is returned instead.' do
      results = Array.new
      enum = [1, 2, 3, 4, 5].my_map
      results << enum.next
      results << enum.next
      results << enum.next
      results << enum.next
      results << enum.next
      expect(results).to eq([1, 2, 3, 4, 5])
    end
  end
  describe "#my_map" do
    it 'should return a new array with the results of running the block once for every element in the hash.' do
      returned = {one: 1, two: 2, three: 3, five: 5, seven: 7, eight: 8}.my_map { |key, value| value * 2 }
      expect(returned).to eq([2, 4, 6, 10, 14, 16])
    end
  end

  describe "#my_map" do
    it 'if no block is given, an Enumerator of the hash is returned instead.' do
      results = Array.new
      enum = {one: 1, two: 2, three: 3, five: 5}.my_map
      results << enum.next
      results << enum.next
      results << enum.next
      results << enum.next
      expect(results).to eq([[:one, 1], [:two, 2], [:three, 3], [:five, 5]])
    end
  end

  describe "#my_map" do
    it 'should return a new array with the results of running the proc once for every element in the array.' do
      my_proc = Proc.new { |value| value * 3 }
      returned =  [1,2,3,4,5,6].my_map my_proc
      expect(returned).to eq([3, 6, 9, 12, 15, 18])
    end
  end

  describe "#my_map" do
    it 'should return a new array with the results of running the block once for every element in the array, then running those results through the proc.' do
      my_proc = Proc.new { |value| value * 3 }
      returned =  [1,2,3,4,5,6].my_map (my_proc) { |value| value + 2 }
      expect(returned).to eq([9, 12, 15, 18, 21, 24])
    end
  end

  describe "#my_map" do
    it 'should return a new array with the results of running the proc once for every element in the hash.' do
      my_proc = Proc.new { |key, value| value * 3 }
      returned =  {one: 1, two: 2, three: 3, five: 5, seven: 7, eight: 8}.my_map my_proc
      expect(returned).to eq([3, 6, 9, 15, 21, 24])
    end
  end

  describe "#my_map" do
    it 'should return a new array with the results of running the block once for every element in the hash, then running those results through the proc.' do
      my_proc = Proc.new { |value| value * 3 }
      returned = {one: 1, two: 2, three: 3, five: 5, seven: 7, eight: 8}.my_map (my_proc) { |key, value| value + 2 }
      expect(returned).to eq([9, 12, 15, 21, 27, 30])
    end
  end

  describe "#my_inject" do
    it 'should combine all the elements of an array by applying the binary operation "add", specified by a block.' do
      returned = [1,2,3,4,5,6].my_inject {|memo, value| memo + value}
      expect(returned).to eq(21)
    end
  end

  describe "#my_inject" do
    it 'should combine all the elements of an array by applying the binary operation "multiply", specified by a block.' do
      returned = [1,2,3,4,5,6].my_inject {|memo, value| memo * value}
      expect(returned).to eq(720)
    end
  end

  describe "#my_inject" do
    it 'should combine all the elements of an array by applying the binary operation "multiply", specified by a block, using supplied argument as the first value.' do
      returned = [1,2,3,4,5,6].my_inject(2) {|memo, value| memo * value}
      expect(returned).to eq(1440)
    end
  end

  describe "#my_inject" do
    it 'should return the longest word in the collection' do
      returned = %w{ice rain snow sleet hail }.my_inject(2) {|memo, value| memo.to_s.length >= value.to_s.length ? memo : value}
      expect(returned).to eq("sleet")
    end
  end

  describe "#multiply_els" do
    it 'should return the product of multiplying the elements of the array' do
      multiply = Multiply.new
      returned = multiply.multiply_els([2,4,5])
      expect(returned).to eq(40)
    end
  end
end
