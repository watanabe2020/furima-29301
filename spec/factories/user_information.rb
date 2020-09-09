FactoryBot.define do
  factory :user_information do
    postcode      {'000-0000'}
    ship_from_id  {Faker::Number.between(from: 1, to: 47)}
    city          { '大阪'}
    block         {'京都35-14'}
    building      {'aplle23当A'}
    phone_number  {'12345678910111213'}
    token      {'aaaaaa'}
    association :user
    association :item
    
  end
end
