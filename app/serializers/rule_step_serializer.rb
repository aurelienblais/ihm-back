# frozen_string_literal: true

class RuleStepSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :order

  belongs_to :rule
  belongs_to :machine
  belongs_to :piece_part
end
