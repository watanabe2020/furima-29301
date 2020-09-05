FactoryBot.define do
  factory :item do
    name                      { 'アイテム' }
    price                     { '10000' }
    product_description       { '商品商品商品' }
    category_id               { '3' }
    product_status_id         { '2' }
    postage_id                { '2' }
    ship_from_id              { '2' }
    date_of_shipment_id       { '2' }
    association :user
  end
end
