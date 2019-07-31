class AddMoreFieldsToBus < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :source, :string
    add_column :buses, :destination, :string
  end
end
