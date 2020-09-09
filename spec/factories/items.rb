FactoryBot.define do
  factory :item do
    name                      { 'アイテムitem商品123' }
    price                     {Faker::Number.between(from: 300, to: 9999999)}
    product_description       { 'アイテムitem商品123' }
    category_id               {Faker::Number.between(from: 2, to: 10)}
    product_status_id         {Faker::Number.between(from: 2, to: 8)}
    postage_id                {Faker::Number.between(from: 2, to: 3)}
    ship_from_id              {Faker::Number.between(from: 2, to: 47)}
    date_of_shipment_id       {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end
