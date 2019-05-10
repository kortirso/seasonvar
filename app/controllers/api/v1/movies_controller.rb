module Api
  module V1
    class MoviesController < Api::V1::BaseController
      before_action :find_movies, only: %i[index]

      resource_description do
        short 'Movies information resources'
        formats ['json']
      end

      api :GET, '/v1/movies.json', 'Get list of movies'
      example '{"movies":[]}'
      def index
        render json: @movies, status: 200
      end

      private

      def find_movies
        @movies = Movie.films.order(created_at: :desc)
      end
    end
  end
end
