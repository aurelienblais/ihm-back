# frozen_string_literal: true

class MachineType < ActiveRecord::Base
  has_many :machines

  validates_presence_of :name
end
