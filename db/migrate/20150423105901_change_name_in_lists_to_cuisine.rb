class ChangeNameInListsToCuisine < ActiveRecord::Migration
  def self.up
    rename_column :lists, :name, :cuisine
  end

  def self.down
    rename_column :lists, :cuisine, :name
  end
end
