class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :status, :role
  end
end
