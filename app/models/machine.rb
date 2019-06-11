# frozen_string_literal: true

class Machine < ActiveRecord::Base
  belongs_to :cellule, optional: true
  belongs_to :machine_type
  belongs_to :rule_step, optional: true

  validates_presence_of :name
end
