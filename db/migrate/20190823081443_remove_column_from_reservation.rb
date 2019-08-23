class RemoveColumnFromReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :user_id, :integer
    remove_column :reservations, :bus_owner_id, :integer
  end
end
