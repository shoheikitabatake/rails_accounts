class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :uid
      t.string :debit_type
      t.integer :debit_id
      t.string :credit_type
      t.integer :credit_id
      t.integer :amount
      t.datetime :trade_date
      t.string :memo

      t.timestamps null: false
    end
  end
end
