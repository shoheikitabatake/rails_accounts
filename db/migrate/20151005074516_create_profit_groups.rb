class CreateProfitGroups < ActiveRecord::Migration
  def change
    create_table :profit_groups do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
