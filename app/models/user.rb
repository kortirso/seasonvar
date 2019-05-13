# Represents users
class User < ApplicationRecord
  devise :database_authenticatable

  has_many :purchases, dependent: :destroy
end
