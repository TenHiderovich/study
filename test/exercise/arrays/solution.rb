module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        result = array.map do |item|
          item > 0 ? max : item
        end
        result
      end

      def search(_array, _query)
        result = _array.index(_query)
        result == nil ? -1 : result
      end
    end
  end
end
