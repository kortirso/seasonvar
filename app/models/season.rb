# Represents seasons of movies
class Season < ApplicationRecord
  belongs_to :movie

  has_many :episodes, dependent: :destroy
end
