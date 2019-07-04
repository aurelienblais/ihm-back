# frozen_string_literal: true

class MachineShortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :machine_type
end
