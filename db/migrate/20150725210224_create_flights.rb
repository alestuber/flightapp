class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :start_id, index: true, foreign_key: true
      t.integer :end_id, index: true, foreign_key: true
      t.datetime :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
