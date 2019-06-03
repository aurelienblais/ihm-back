# frozen_string_literal: true

class Rule < ActiveRecord::Base
  has_many :machines

  validates_presence_of :name
end
