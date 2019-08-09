class AddColumnToSeat < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :reserved, :boolean, default:false
  end
end
