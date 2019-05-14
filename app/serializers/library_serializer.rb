class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :created_at, :purchaseable

  def purchaseable
    return movie_data if object.purchaseable.is_a?(Movie)
    season_data
  end

  private

  def movie_data
    MovieSerializer.new(object.purchaseable)
  end

  def season_data
    season = object.purchaseable
    {
      movie: MovieSerializer.new(season.movie),
      season: SeasonSerializer.new(season)
    }
  end
end
