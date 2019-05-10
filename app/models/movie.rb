# Represents movies
class Movie < ApplicationRecord
  has_many :seasons, dependent: :destroy
end
