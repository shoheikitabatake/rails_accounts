class RenameProperty < ActiveRecord::Migration
  def change
    rename_table :properties, :properties
    rename_table :property_groups, :property_groups
  end
end
