# Represents seasons of movies
class Season < ApplicationRecord
  include Purchaseable

  belongs_to :movie, counter_cache: :seasons_count, touch: true

  has_many :episodes, dependent: :destroy
end
