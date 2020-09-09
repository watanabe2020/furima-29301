FactoryBot.define do
  factory :user_information do
    postcode      {'000-0000'}
    ship_from_id  {Faker::Number.between(from: 1, to: 47)}
    city          { Gimei.first.katakana}
    block         {'京都35-14'}
    building      {'aplle23当A'}
    phone_number  {Faker::Number.number(digits: 11)}
    token      {'aaaaaa'}
    association :user
    association :item
    
  end
end
