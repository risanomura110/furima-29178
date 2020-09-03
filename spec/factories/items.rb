FactoryBot.define do
  factory :item do
    item_name             { '商品の名前' }
    info                  { '商品の情報' }
    category_id           { '2' }
    status_id             { '2' }
    shipping_id           { '2' }
    area_id               { '2' }
    schedule_id           { '2' }
    price                 { '1000' }
    association :user
  end
end