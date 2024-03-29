# frozen_string_literal: true

FactoryBot.define do
  factory :rule do
    sequence(:name) { |n| "Rule #{n}" }
  end
end
