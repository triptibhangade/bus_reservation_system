class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string , default: "customer"
  end
end

