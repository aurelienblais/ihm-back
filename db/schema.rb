# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_603_131_502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cellules', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'machine_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'machines', force: :cascade do |t|
    t.string 'name'
    t.boolean 'available'
    t.bigint 'cellule_id'
    t.bigint 'machine_type_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cellule_id'], name: 'index_machines_on_cellule_id'
    t.index ['machine_type_id'], name: 'index_machines_on_machine_type_id'
  end

  create_table 'piece_parts', force: :cascade do |t|
    t.string 'name'
    t.integer 'stock'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'rule_steps', force: :cascade do |t|
    t.string 'name'
    t.integer 'order'
    t.bigint 'rule_id'
    t.bigint 'machine_id'
    t.bigint 'piece_part_id'
    t.index ['machine_id'], name: 'index_rule_steps_on_machine_id'
    t.index ['piece_part_id'], name: 'index_rule_steps_on_piece_part_id'
    t.index ['rule_id'], name: 'index_rule_steps_on_rule_id'
  end

  create_table 'rules', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
