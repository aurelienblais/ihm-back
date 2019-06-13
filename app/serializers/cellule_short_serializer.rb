# frozen_string_literal: true

class CelluleShortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
end
