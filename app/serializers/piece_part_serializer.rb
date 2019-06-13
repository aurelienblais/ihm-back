class PiecePartSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :name, :stock
end
