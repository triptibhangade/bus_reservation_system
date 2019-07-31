class AddMoreColumnsToBusOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_owners, :name, :string
    add_column :bus_owners, :status, :string, default: "pending"
  end
end
