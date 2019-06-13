# frozen_string_literal: true

class Machine < ActiveRecord::Base
  belongs_to :cellule, optional: true
  belongs_to :machine_type
  has_many :rule_steps
  has_many :rule, through: :rule_steps

  validates_presence_of :name
end
