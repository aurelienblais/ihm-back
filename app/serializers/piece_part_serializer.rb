# frozen_string_literal: true

class PiecePartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :stock
end
