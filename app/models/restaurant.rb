class Restaurant < ActiveRecord::Base
  has_many :selections
  has_many :lists, through: :selections
  has_many :restaurantimgs
end
