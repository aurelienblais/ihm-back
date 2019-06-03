# frozen_string_literal: true

class CreateMachineType < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
