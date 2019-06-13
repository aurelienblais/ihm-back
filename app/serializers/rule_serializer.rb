class RuleSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :name
  has_many :rule_steps
end
