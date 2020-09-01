class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        has_many :items
        has_many :buyers


        with_options presence: true do
        validates :nickname format: { with: /\A[a-z0-9]+\z/i, message: "半角文字で入力してください"}
        validates :mail, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.massage: "もう一度入力してください" }
        validates :last_name  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
        validates :first_name  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
        validates :last_name_kana  format: { with: /\A[ァ-ヶー－]+\z/, message: "全角で入力してください"}
        validates :first_name_kana  format: { with: /\A[ァ-ヶー－]+\z/, message: "全角で入力してください"}
        validates :birthday_chack format: { with: /\A\d{4}\d{2}\d{2}\z/ }
        end

end