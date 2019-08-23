class AddPolymorphicColumnToReservation < ActiveRecord::Migration[5.2]
   def up
    change_table :reservations do |t|
      t.references :reservable, polymorphic: true
    end
  end
end
