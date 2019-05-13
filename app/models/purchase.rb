# Represents purchases
class Purchase < ApplicationRecord
  belongs_to :purchaseable, polymorphic: true
  belongs_to :user
end
