class Item < ApplicationRecord
  belong_to :user
  has_one   :buyer

  with_options presence: true do
    validates :name length: {maximum: 40}
    validates :price { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :product_description length: {maximum: 1000}
    validates :category_id
    validates :product_status_id
    validates :ship_from_id
    validates :date_of_shipment_id
  end

end
