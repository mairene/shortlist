class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :restaurant
      t.references :list

      t.timestamp
    end
  end
end
