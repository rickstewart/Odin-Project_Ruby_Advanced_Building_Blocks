class BubbleSortBy

  def bubble_sort_by(unsorted)
    sorted = unsorted.dup
    length, index = sorted.length - 1, 0
    sorted.each do
      while index < length
        if block_given?
          result = yield sorted[index], sorted[index + 1]
          if result < 0
            sorted[index], sorted[index + 1] = sorted[index + 1], sorted[index]
          end
        elsif sorted[index] > sorted[index + 1]
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
