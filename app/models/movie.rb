# Represents movies
class Movie < ApplicationRecord
  include Purchaseable

  has_many :seasons, dependent: :destroy

  scope :films, -> { where(seasons_count: 0) }
  scope :tv_shows, -> { where('seasons_count > ?', 0) }
  scope :ordered, -> { order(created_at: :desc) }

  def self.cache_key(records, title)
    {
      serializer: title,
      stat_record: records.maximum(:updated_at)
    }
  end

  def film?
    seasons_count.zero?
  end

  def tv_show?
    seasons_count.positive?
  end
end
