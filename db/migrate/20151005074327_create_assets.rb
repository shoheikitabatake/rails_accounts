class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.integer :stock

      t.timestamps null: false
    end
  end
end
