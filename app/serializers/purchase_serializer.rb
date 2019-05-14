class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :purchaseable_id, :purchaseable_type, :created_at
end
