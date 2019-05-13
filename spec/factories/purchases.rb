FactoryBot.define do
  factory :purchase do
    association :user
    association :purchaseable, factory: :movie
  end
end
