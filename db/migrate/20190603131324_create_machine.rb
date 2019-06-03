# frozen_string_literal: true

class CreateMachine < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.boolean :available

      t.belongs_to :cellule
      t.belongs_to :machine_type

      t.timestamps
    end
  end
end
