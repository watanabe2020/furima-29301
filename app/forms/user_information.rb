class UserInformation
  include ActiveModel::Model
  attr_accessor :postcode, :ship_from_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角文字で入力してください' }
    validates :ship_from_id, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
    validates :block
    validates :token
    validates :phone_number, format: { with: /\A[0-9]+\z/i, message: '半角数字で入力してください' }
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    LivingPlace.create(buyer_id: buyer.id, postcode: postcode, ship_from_id: ship_from_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end
