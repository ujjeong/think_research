class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :visit_number, null:false
      t.date :admitted_at, null:false
      t.date :discharged_at, null:false
      t.string :location
      t.integer :room
      t.integer :bed
      t.references :patient, index: true, foreign_key: true
    end
  end
end
