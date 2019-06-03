# frozen_string_literal: true

class PiecePart < ActiveRecord::Base
  has_many :rule_steps

  validates_presence_of :name, :stock
end
