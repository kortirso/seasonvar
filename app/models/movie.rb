# Represents movies
class Movie < ApplicationRecord
  include Purchaseable

  has_many :seasons, dependent: :destroy

  scope :films, -> { where seasons_count: 0 }
  scope :tv_shows, -> { where('seasons_count > ?', 0) }
  scope :ordered, -> { order(created_at: :desc) }

  def film?
    seasons_count.zero?
  end

  def tv_show?
    seasons_count.positive?
  end
end
