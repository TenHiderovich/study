module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_country = array.select do |film|
          countries = film['country']
          countries && countries.split(',').size >= 2
        end

        filtered_rating = filtered_country.select do |film|
          rating = film['rating_kinopoisk'].to_f
          rating && rating > 0.0
        end

        ratings = filtered_rating.map { |film| film['rating_kinopoisk'].to_f }
        # |a, e| требование rubocop
        sum_rating = ratings.reduce(0.0) { |a, e| a + e }

        sum_rating / ratings.size
      end

      def chars_count(films, threshold)
        filtered_films = films.select do |film|
          rating = film['rating_kinopoisk'].to_f
          film if rating >= threshold
        end

        i_count = filtered_films.reduce(0) do |acc, film|
          name = film['name']
          name.each_char { |char| acc += 1 if char == 'и' }
          acc
        end

        i_count
      end
    end
  end
end
