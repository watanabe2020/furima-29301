class UserInformation

  include ActiveModel::Model
  attr_accessor :postcode, :ship_from_id, :city,:block, :building, :phone_number,:item_id, :user_id ,:token,:buyer_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角文字で入力してください' }
    validates :ship_from_id, numericality: { other_than: 0 }
    validates :city 
    validates :block
    validates :building
    validates :token
    validates :phone_number, format: { with: /\A[0-9]+\z/i, message: '半角数字で入力してください' }
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = LivingPlace.create(buyer_id: buyer_id ,postcode: postcode, ship_from_id: ship_from_id, city: city,block: block,building: building,phone_number: phone_number ,item_id:
    item_id, user_id: user.id)

    Buyer.create(user_id: user.id,item_id: item_id)

  end
end 
