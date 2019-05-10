# Represents seasons of movies
class Season < ApplicationRecord
  belongs_to :movie, counter_cache: :seasons_count

  has_many :episodes, dependent: :destroy
end
