class AddColumnsCashiers < ActiveRecord::Migration
  def change
    add_column :cashiers, :name, :string
    add_column :cashiers, :password, :string
  end
end
