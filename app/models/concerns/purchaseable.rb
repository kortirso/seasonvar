# Represents objects available for purchases
module Purchaseable
  extend ActiveSupport::Concern

  included do
    has_many :purchases, as: :purchaseable, dependent: :destroy
  end

  def can_be_purchased?
    return true if is_a?(Movie) && film?
    return true if is_a?(Season)
    false
  end
end
