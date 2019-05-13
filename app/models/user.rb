# Represents users
class User < ApplicationRecord
  devise :database_authenticatable
end
