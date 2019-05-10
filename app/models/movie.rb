# Represents movies
class Movie < ApplicationRecord
  has_many :seasons, dependent: :destroy

  scope :films, -> { where seasons_count: 0 }
  scope :tv_shows, -> { where('seasons_count > ?', 0) }
end
