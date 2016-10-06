class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :nickname, :string
    add_column :users, :function, :string
  end
end
