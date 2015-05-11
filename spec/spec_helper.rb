require_relative '../bubble_sort'
require_relative '../bubble_sort_by'
require_relative '../my_enumerable_'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
