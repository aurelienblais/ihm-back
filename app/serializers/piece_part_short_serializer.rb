# frozen_string_literal: true

class PiecePartShortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
end
