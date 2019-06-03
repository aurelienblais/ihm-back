# frozen_string_literal: true

class CreateRule < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name

      t.timestamps
    end
  end
end
