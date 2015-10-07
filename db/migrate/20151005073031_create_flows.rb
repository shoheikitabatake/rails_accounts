class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.integer :user_id
      t.string :credit_type
      t.string :credit_id
      t.string :integer
      t.string :debit_type
      t.integer :debit_id
      t.datetime :date
      t.string :memo

      t.timestamps null: false
    end
  end
end
