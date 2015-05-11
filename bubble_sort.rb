class BubbleSort

  def bubble_sort(unsorted)
    sorted = unsorted.dup
    length, index = sorted.length - 1, 0
    sorted.each do
      while index < length
        if sorted[index] > sorted[index + 1]
          sorted[index], sorted[index + 1] = sorted[index + 1], sorted[index]
        end
        index += 1
      end
      length -= 1
      index = 0
    end
    sorted
  end
end
