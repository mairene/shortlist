class Selection < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :list
end
