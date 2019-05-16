module Api
  module V1
    class MoviesController < Api::V1::BaseController
      before_action :find_movies, only: %i[index]
      before_action :find_tv_shows, only: %i[tv_shows]
      before_action :find_all_movies, only: %i[all]

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

      api :GET, '/v1/movies/all.json', 'Get list of movies and tv_shows'
      example '{"movies":[]}'
      def all
        render json: @movies, status: 200
      end

      private

      def find_movies
        @movies = CacheHelper.json_cache(Movie.films.ordered, 'movies', 'movies', MovieSerializer)
      end

      def find_tv_shows
        @tv_shows = CacheHelper.json_cache(Movie.tv_shows.ordered, 'tv_shows', 'tv_shows', TvShowSerializer)
      end

      def find_all_movies
        @movies = CacheHelper.json_cache(Movie.ordered, 'movies_all', 'movies', MovieSerializer)
      end
    end
  end
end
