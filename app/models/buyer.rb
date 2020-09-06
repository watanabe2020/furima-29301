class Buyer < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :living_place

end
