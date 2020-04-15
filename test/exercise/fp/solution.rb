module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        filtered_films = _array
          .select { |film|
            countries = film["country"]
            !countries.nil? && countries.split(',').size >= 2
          }.select { |film|
            rating = film["rating_kinopoisk"].to_f
            !rating.nil? && rating > 0.0
          }

        ratings = filtered_films.map { |film| film["rating_kinopoisk"].to_f }
        sum_rating = ratings.reduce(0.0) { |sum, rating| sum += rating }

        sum_rating / filtered_films.size
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
