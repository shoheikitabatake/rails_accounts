class RenameUidToJournals < ActiveRecord::Migration
  def change
    rename_column :journals, :uid, :user_id
  end
end
