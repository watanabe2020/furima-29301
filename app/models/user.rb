class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buyers

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角文字で入力してください' }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, massage: 'もう一度入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'で入力してください' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/i, message: 'は数字と小文字を必ず1文字使ってください' }
    validates :birthday
  end
end
