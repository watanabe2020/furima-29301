class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :product_status
  belongs_to_active_hash :postage
  belongs_to_active_hash :date_of_shipment

  belongs_to :user
  has_one :buyer
  has_one_attached :image
  has_one :buyer

  with_options presence: true do
    validates :name, length:        { maximum: 40 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は指定の範囲外です' }
    validates :price, format:       { with: /\A[a-z0-9]+\z/i, message: 'は半角文字で入力してください' }
    validates :product_description, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message:"は空白以外を選択してください"}
    validates :product_status_id, numericality: { other_than: 1,message:"は空白以外を選択してください" }
    validates :postage_id, numericality: { other_than: 1,message:"は空白以外を選択してください" }
    validates :ship_from_id, numericality: { other_than: 0,message:"は空白以外を選択してください" }
    validates :date_of_shipment_id, numericality: { other_than: 1,message:"は空白以外を選択してください" }
    validates :image
  end
  
  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
