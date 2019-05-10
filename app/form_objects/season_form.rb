# Represents form object for Season model
class SeasonForm
  include ActiveModel::Model
  include Virtus.model

  attribute :movie, Movie
  attribute :number, Integer

  validates :movie, :number, presence: true
  validates :number, numericality: { greater_than: 0 }

  attr_reader :season

  def persist?
    return false if exist?
    return false unless valid?
    @season = Season.new
    @season.attributes = attributes
    @season.save
    true
  end

  private

  def exist?
    Season.find_by(movie: movie, number: number)
  end
end
