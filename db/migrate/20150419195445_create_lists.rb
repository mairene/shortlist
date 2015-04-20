class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :neighborhood

      t.timestamps
    end
  end
end
