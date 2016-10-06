class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    remove_column :users, :pseudo, :string
  end
end
