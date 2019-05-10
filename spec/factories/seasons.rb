FactoryBot.define do
  factory :season do
    number { 1 }
    association :movie
  end
end
