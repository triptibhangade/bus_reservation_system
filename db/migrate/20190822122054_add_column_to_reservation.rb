class AddColumnToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :boolean, default:true
  end
end
