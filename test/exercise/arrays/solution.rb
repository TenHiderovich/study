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

      def search(array, query)
        return -1 if array.empty?

        length = array.length

        if length == 1
          array[0] == query ? 0 : -1
        end

        middle = length / 2
        value = array[middle] - query

        if value == 0
          middle
        elsif value > 0
          search_result = search(array[0..middle - 1], query)
          search_result == -1 ? -1 : search_result
        else
          search_result = search(array[middle + 1..length - 1], query)
          search_result == -1 ? -1 : search_result + middle + 1
        end
      end
    end
  end
end
