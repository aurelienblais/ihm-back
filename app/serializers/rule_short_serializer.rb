# frozen_string_literal: true

class RuleShortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
end
