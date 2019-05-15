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
        @movies = Rails.cache.fetch('movies') do
          ActiveModelSerializers::SerializableResource.new(Movie.films.ordered, root: 'movies', each_serializer: MovieSerializer).to_json
        end
      end

      def find_tv_shows
        @tv_shows = Rails.cache.fetch('tv_shows') do
          ActiveModelSerializers::SerializableResource.new(Movie.tv_shows.ordered, root: 'tv_shows', each_serializer: TvShowSerializer).to_json
        end
      end

      def find_all_movies
        @movies = Rails.cache.fetch('movies_all') do
          ActiveModelSerializers::SerializableResource.new(Movie.ordered, root: 'movies', each_serializer: MovieSerializer).to_json
        end
      end
    end
  end
end
