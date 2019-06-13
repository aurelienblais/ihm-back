# frozen_string_literal: true

FactoryBot.define do
  factory :machine do
    sequence(:name) { |n| "Machine #{n}" }
    available { true }
    cellule
    machine_type
  end
end
