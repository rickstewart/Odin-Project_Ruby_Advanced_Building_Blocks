require 'rspec'
require 'spec_helper'

describe 'class Hash' do
  describe "#my_each" do
    it 'calls block once for each key/value pair in self (a Hash), passing that pair to the block as a parameter' do
      accumulator = Hash.new
      {one: 1,two: 2, three: 3,four: 4}.my_each { |key, value| accumulator[key] = (value * 2) }
      expect(accumulator).to eq({one: 2,two: 4, three: 6,four: 8})
    end
  end

  describe "#my_each" do
    it 'if no block is given an Enumerator of the Hash is returned' do
      accumulator = Array.new
      enum = {one: 1,two: 2, three: 3,four: 4}.my_each
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator << enum.next
      accumulator = accumulator.to_h
      expect(accumulator).to eq({one: 1,two: 2, three: 3,four: 4})
    end
  end
end
