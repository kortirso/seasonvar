class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :created_at
end
