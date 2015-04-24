class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating_url, :string
  end
end
