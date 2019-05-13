FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "test#{i}@gmail.com" }
    password { 'password12' }
  end
end
