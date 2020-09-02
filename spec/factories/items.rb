FactoryBot.define do
  factory :item do
    item_name             { '商品の名前' }
    info                  { '商品の情報' }
    category_id           { '' }
    status_id             { '' }
    shipping_id           { '' }
    area_id               { '' }
    chedulu_id            { '' }
    price                 { '1000' }
    
    user_id              { '' }
  end
end