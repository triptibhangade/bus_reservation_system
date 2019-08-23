class ChangeColumnToBusOwner < ActiveRecord::Migration[5.2]
  def change
    change_column :bus_owners, :gst_no, :string
  end
end
