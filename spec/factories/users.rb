FactoryBot.define do
  factory :user do
    nickname { 'wawawa' }
    email { 'ddddddddddd@gmail.com' }
    password { '1a1a1a' }
    first_name { '山田' }
    last_name { 'たろう' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
