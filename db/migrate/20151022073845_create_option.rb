class CreateOption < ActiveRecord::Migration
  def change
    change_column( :properties, :stock, :integer, null:false, default: 0)
    change_column( :debts, :stock, :integer, null:false, default: 0)
    change_column( :profits, :stock, :integer, null:false, default: 0)
    change_column( :losses, :stock, :integer, null:false, default: 0)
    change_column( :profits, :budget, :integer, null:false, default: 0)
    change_column( :losses, :budget, :integer, null:false, default: 0)
  end
end
