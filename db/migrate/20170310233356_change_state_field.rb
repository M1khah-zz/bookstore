class ChangeStateField < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :state, :string, default: 'in_progress'
  end
end
