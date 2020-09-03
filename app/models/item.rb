class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipfrom
  belongs_to_active_hash :productstatus
  belongs_to_active_hash :postage
  belongs_to_active_hash :dateofshipment

  belongs_to :user
  has_one   :buyer

  with_options presence: true do
    validates :name,length: {maximum: 40}
    validates :price#,{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :product_description, length: {maximum: 1000}
    validates :category_id
    validates :product_status_id
    validates :ship_from_id
    validates :date_of_shipment_id
  end

end
