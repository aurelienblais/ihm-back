# frozen_string_literal: true

class CreateRuleStep < ActiveRecord::Migration[5.2]
  def change
    create_table :rule_steps do |t|
      t.string :name
      t.integer :order

      t.belongs_to :rule
      t.belongs_to :machine
      t.belongs_to :piece_part
    end
  end
end
