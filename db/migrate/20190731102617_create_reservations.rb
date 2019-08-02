class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_date
      t.references :bus, foreign_key: true
      t.integer :user_id
      t.integer :bus_owner_id      

      t.timestamps
    end
  end
end
