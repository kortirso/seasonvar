# Represents form object for Movie model
class MovieForm
  include ActiveModel::Model
  include Virtus.model

  attribute :plot, String
  attribute :title, String

  validates :title, :plot, presence: true

  attr_reader :movie

  def persist?
    return false if exist?
    return false unless valid?
    @movie = Movie.new
    @movie.attributes = attributes
    @movie.save
    true
  end

  private

  def exist?
    Movie.find_by(title: title)
  end
end
