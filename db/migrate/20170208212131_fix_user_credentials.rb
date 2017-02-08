class FixUserCredentials < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :first_name, :firstname
    rename_column :users, :last_name, :lastname
  end
end
