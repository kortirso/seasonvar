module Api
  module V1
    class MoviesController < Api::V1::BaseController
      before_action :find_movies, only: %i[index]
      before_action :find_tv_shows, only: %i[tv_shows]

      resource_description do
        short 'Movies information resources'
        formats ['json']
      end

      api :GET, '/v1/movies.json', 'Get list of movies'
      example '{"movies":[]}'
      def index
        render json: @movies, status: 200
      end

      api :GET, '/v1/movies/tv_shows.json', 'Get list of tv_shows'
      example '{"movies":[]}'
      def tv_shows
        render json: @tv_shows, status: 200
      end

      private

      def find_movies
        @movies = Movie.films.order(created_at: :desc)
      end

      def find_tv_shows
        result = Movie.tv_shows.order(created_at: :desc)
        @tv_shows = ActiveModelSerializers::SerializableResource.new(result, root: 'tv_shows', each_serializer: TvShowSerializer).as_json
      end
    end
  end
end
