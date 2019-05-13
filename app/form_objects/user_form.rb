# Represents form object for User model
class UserForm
  include ActiveModel::Model
  include Virtus.model

  attribute :email, String
  attribute :password, String

  validates :email, :password, presence: true
  validates :password, length: { minimum: 10 }

  attr_reader :user

  def persist?
    return false unless valid?
    return false if exist?
    @user = User.new
    @user.attributes = attributes
    @user.save
    true
  end

  private

  def exist?
    User.find_by(email: email)
  end
end
