class MachineSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :name, :available, :cellule, :machine_type, :created_at, :updated_at
end
