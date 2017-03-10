class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :state, default: 1
      t.decimal :total_price
      t.decimal :subtotal
      t.float :coupon


      t.timestamps
    end
  end
end
