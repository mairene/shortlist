class List < ActiveRecord::Base
  has_many :selections
  has_many :restaurants, through: :selections
  belongs_to :user
end
