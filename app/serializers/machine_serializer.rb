# frozen_string_literal: true

class MachineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :available, :cellule, :created_at, :updated_at

  attributes :rules do |machine|
    RuleSerializer.new(machine.rules).as_json
  end

  attributes :machine_type do |machine|
    MachineTypeSerializer.new(machine.machine_type).as_json
  end
end
