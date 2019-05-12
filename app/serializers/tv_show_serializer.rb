class TvShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :created_at
  has_many :seasons do
    object.seasons.order(number: :asc)
  end
end
