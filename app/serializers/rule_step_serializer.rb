# frozen_string_literal: true

class RuleStepSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :order

  attributes :piece_part do |rule_step|
    PiecePartSerializer.new(rule_step.piece_part).as_json
  end
end
