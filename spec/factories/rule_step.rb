FactoryBot.define do
  factory :rule_step do
    sequence(:name) { |n| "RuleStep #{n}" }
    sequence(:order) { |n| n }
    rule
    machine
    piece_part
  end
end
