# frozen_string_literal: true

class Cellule < ActiveRecord::Base
  has_many :rule_steps

  validates_presence_of :name
end
