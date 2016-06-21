class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null:false
      t.string :middle_name, null:false
      t.string :last_name
      t.integer :weight
      t.integer :height
      t.string :mrn, null:false
    end
  end
end
