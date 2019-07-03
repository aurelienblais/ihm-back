# frozen_string_literal: true

class MachineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :available, :cellule, :machine_type, :created_at, :updated_at

  attributes :rules do |machine|
    RuleSerializer.new(machine.rules).as_json
  end
end
