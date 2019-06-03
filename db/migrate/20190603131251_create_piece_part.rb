# frozen_string_literal: true

class CreatePiecePart < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_parts do |t|
      t.string :name
      t.integer :stock

      t.timestamps
    end
  end
end
