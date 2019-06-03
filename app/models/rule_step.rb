# frozen_string_literal: true

class RuleStep < ActiveRecord::Base
  belongs_to :rule
  belongs_to :machine
  belongs_to :piece_part

  validates_presence_of :name, :order
end
