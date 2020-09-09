class Buyer < ApplicationRecord
  attr_accessor :token

  belongs_to :item
  belongs_to :user
  has_one    :living_place
end
