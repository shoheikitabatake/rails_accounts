class ChangeDatatypeTradeDateOfJournals < ActiveRecord::Migration
  def change
    change_column :journals, :trade_date, :date
  end
end
