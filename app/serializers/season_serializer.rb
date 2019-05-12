class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :number, :episodes

  def episodes
    object.episodes.order(number: :asc).map do |episode|
      {
        id: episode.id,
        number: episode.number
      }
    end
  end
end
