class AddNameToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :login, :string
  end
end
