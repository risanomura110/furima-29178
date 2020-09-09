FactoryBot.define do
  factory :address do
    postal             { '000-0000' }
    prefecture_id      { '2' }
    city               { '名古屋市' }
    add                { '番地' }
    building           { 'ビルの名前' }
    phone              { '12345678910' }
    order_id           { '2' }
    association :order
  end
end
