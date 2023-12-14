class CreateWiseusers < ActiveRecord::Migration[7.1]
  def change
    create_table :wiseusers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.string :uuid , null: false

      t.timestamps
    end
  end
end
