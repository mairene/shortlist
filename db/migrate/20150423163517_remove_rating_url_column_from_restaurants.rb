class RemoveRatingUrlColumnFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :rating_url
  end
end
