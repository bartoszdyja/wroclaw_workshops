class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :balance, default: 0
      t.date :payment_date

      t.timestamps null: false
    end
  end
end
