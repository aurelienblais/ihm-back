# frozen_string_literal: true

class Rule < ActiveRecord::Base
  has_many :machines
  has_many :rule_steps

  validates_presence_of :name
end
