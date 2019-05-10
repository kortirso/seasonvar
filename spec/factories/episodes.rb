FactoryBot.define do
  factory :episode do
    number { 1 }
    association :season
  end
end
