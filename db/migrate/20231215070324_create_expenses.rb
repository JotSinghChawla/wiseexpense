class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :wiseuser, null: false, foreign_key: true
      t.integer :amount, null: false, default: 0
      t.integer :main_category
      t.integer :sub_category
      t.integer :payment_mode
      t.text :description
      t.datetime :expense_time
      t.json :meta, default: {}

      t.timestamps
    end
  end
end
