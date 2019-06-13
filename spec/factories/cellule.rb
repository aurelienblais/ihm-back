FactoryBot.define do
  factory :cellule do
    sequence(:name) { |n| "Cellule #{n}" }
  end
end
