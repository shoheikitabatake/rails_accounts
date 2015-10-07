class CreateAssetGroups < ActiveRecord::Migration
  def change
    create_table :asset_groups do |t|
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
