# Represents form object for Episode model
class EpisodeForm
  include ActiveModel::Model
  include Virtus.model

  attribute :season, Season
  attribute :number, Integer

  validates :season, :number, presence: true
  validates :number, numericality: { greater_than: 0 }

  attr_reader :episode

  def persist?
    return false if exist?
    return false unless valid?
    @episode = Episode.new
    @episode.attributes = attributes
    @episode.save
    true
  end

  private

  def exist?
    Episode.find_by(season: season, number: number)
  end
end
