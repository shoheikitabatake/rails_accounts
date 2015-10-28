class AddGroupIdIndexToProperties < ActiveRecord::Migration
  def change
    # add_index user_id
    add_index :properties, :user_id
    add_index :property_groups, :user_id
    add_index :debts, :user_id
    add_index :debt_groups, :user_id
    add_index :profits, :user_id
    add_index :profit_groups, :user_id
    add_index :losses, :user_id
    add_index :loss_groups, :user_id
    add_index :journals, [:user_id, :trade_date]

    # add_index group_id
    add_index :properties, :group_id
    add_index :debts, :group_id
    add_index :profits, :group_id
    add_index :losses, :group_id
    add_index :properties, [:user_id, :group_id]
    add_index :debts, [:user_id, :group_id]
    add_index :profits, [:user_id, :group_id]
    add_index :losses, [:user_id, :group_id]
  end
end
