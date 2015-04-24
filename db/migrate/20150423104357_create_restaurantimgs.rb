class CreateRestaurantimgs < ActiveRecord::Migration
  def change
    create_table :restaurantimgs do |t|
      t.string :img_url
      t.references :restaurant
    end
  end
end
