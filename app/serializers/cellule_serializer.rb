# frozen_string_literal: true

class CelluleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :updated_at
  has_many :machines
end
