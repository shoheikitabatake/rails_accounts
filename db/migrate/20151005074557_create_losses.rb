class CreateLosses < ActiveRecord::Migration
  def change
    create_table :losses do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.integer :budget

      t.timestamps null: false
    end
  end
end
