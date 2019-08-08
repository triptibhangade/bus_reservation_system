class ChangeColumnDatetimeToDate < ActiveRecord::Migration[5.2]
  def up
    change_column :reservations, :reservation_date, :date
  end

  def down
    change_column :reservations, :reservation_date, :datetime
  end
end
