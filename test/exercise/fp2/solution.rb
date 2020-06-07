module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield(item)
        end
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(acc, item) { acc << yield(item) }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, item) { item.nil? ? acc : acc << item }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |element| acc = acc.nil? ? element : yield(acc, element) }
        acc
      end
    end
  end
end
