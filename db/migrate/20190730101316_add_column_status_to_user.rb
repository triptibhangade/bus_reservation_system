class AddColumnStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :string , default: "customer"
  end
end
