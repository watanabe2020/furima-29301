class LivingPlace < ApplicationRecord
  belongs_to :buyer

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角文字で入力してください' }
    validates :ship_from_id, numericality: { other_than: 0 }
    validates :city 
    validates :block
    validates :building
    validates :phone_number, format: { with: /\A[0-9]+\z/i, message: '半角数字で入力してください' }

  end