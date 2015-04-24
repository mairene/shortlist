class AddColumnsImageRatingAndUrlToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :image_img, :string
    add_column :restaurants, :rating_img, :string
    add_column :restaurants, :url, :string
  end
end
