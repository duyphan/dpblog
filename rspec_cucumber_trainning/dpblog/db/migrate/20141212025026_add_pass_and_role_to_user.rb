class AddPassAndRoleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :password, :string
  	add_column :users, :password_confirmation, :string
  	add_column :users, :admin, :boolean
  end
end
