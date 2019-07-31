class AddMoreFieldsToBusOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_owners, :gst_no, :integer
    add_column :bus_owners, :license, :string
  end
end
