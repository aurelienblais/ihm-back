FactoryBot.define do
  factory :rule do
    sequence(:name) { |n| "Rule #{n}" }
  end
end
