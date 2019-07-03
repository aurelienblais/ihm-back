# frozen_string_literal: true

class RuleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attributes :rule_steps do |rule|
    RuleStepSerializer.new(rule.rule_steps).as_json
  end
end
