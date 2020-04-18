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
        result = array.index(query)
        result.nil? ? -1 : result
      end
    end
  end
end
