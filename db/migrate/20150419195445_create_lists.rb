class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :neighborhood
      t.boolean :trash
      t.boolean :gold
      t.references :user

      t.timestamps
    end
  end
end
