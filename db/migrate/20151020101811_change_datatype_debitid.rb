class ChangeDatatypeDebitid < ActiveRecord::Migration
  def change
    change_column :journals, :debit_type, :integer
    change_column :journals, :credit_type, :integer
  end
end
