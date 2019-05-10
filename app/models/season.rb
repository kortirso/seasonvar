# Represents seasons of movies
class Season < ApplicationRecord
  belongs_to :movie
end
