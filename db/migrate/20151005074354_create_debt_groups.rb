class CreateDebtGroups < ActiveRecord::Migration
  def change
    create_table :debt_groups do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
