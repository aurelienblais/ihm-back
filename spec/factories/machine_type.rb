# frozen_string_literal: true

FactoryBot.define do
  factory :machine_type do
    sequence(:name) { |n| "MachineType #{n}" }
  end
end
