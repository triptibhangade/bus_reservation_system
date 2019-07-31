class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :registration_no
      t.integer :total_no_of_seats
      t.references :bus_owner, foreign_key: true

      t.timestamps
    end
  end
end
