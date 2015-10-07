class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.integer :stock

      t.timestamps null: false
    end
  end
end
