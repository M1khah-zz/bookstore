class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :firstname
      t.string :lastname
      t.integer :number
      t.integer :cvv
      t.integer :exp_month
      t.integer :exp_year

      t.timestamps
    end
  end
end
