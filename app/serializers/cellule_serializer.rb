# frozen_string_literal: true

class CelluleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :updated_at

  attributes :machines do |cellule|
    MachineSerializer.new(cellule.machines).as_json
  end
end
