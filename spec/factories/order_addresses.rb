FactoryBot.define do
  factory :order_address do
    postal { '000-0000' }
    prefecture_id      { '2' }
    city               { '名古屋市' }
    add                { '番地' }
    building           { 'ビルの名前' }
    phone              { '12345678901' }
    order_id           { '4' }
    item_id            { '3' }
    user_id            { '3' }
    association :user
    association :item
  end
end
