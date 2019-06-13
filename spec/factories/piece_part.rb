FactoryBot.define do
  factory :piece_part do
    sequence(:name) { |n| "MachineType #{n}" }
    stock { 0 }
  end
end
