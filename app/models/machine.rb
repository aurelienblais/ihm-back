# frozen_string_literal: true

class Machine < ActiveRecord::Base
  belongs_to :cellule
  belongs_to :machine_type
  belongs_to :rule_step

  validates_presence_of :name, :available
end
