class AddDescToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :description, :string, default: '', :null => false
  end
end
