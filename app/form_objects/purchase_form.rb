# Represents form object for Purchase model
class PurchaseForm
  include ActiveModel::Model
  include Virtus.model

  attribute :purchaseable_id, Integer
  attribute :purchaseable_type, String
  attribute :user, User
  attribute :video_quality, String

  validates :purchaseable_id, :purchaseable_type, :user, :video_quality, presence: true
  validates :video_quality, inclusion: { in: %w[HD SD] }
  validates :purchaseable_type, inclusion: { in: %w[Movie Season] }

  attr_reader :purchase

  def persist?
    return false unless purchaseable_exist?
    return false unless purchaseable_can_be_purchased?
    return false if exist?
    return false unless valid?
    @purchase = Purchase.new
    @purchase.attributes = attributes
    @purchase.save
    true
  end

  private

  def purchaseable_exist?
    @purchaseable = purchaseable_type.constantize.find_by(id: purchaseable_id)
  end

  def purchaseable_can_be_purchased?
    @purchaseable.can_be_purchased?
  end

  def exist?
    user.purchases.where('created_at > ?', DateTime.now - 2.days).find_by(purchaseable: @purchaseable)
  end
end
