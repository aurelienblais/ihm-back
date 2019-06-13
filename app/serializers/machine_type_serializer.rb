# frozen_string_literal: true

class MachineTypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :updated_at
end
