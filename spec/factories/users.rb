FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {"aiueo110@gmail.com"}
    password              {"aiueo12345"}
    password_confirmation {password}
    family_kanji          {"山田"}
    first_kanji           {"太郎"}
    family_kana           {"ヤマダ"}
    first_kana            {"タロウ"}
    birthday              {"1924-06-03"}
  end
end
# Faker::Internet.free_email
#Faker::Internet.password(min_length: 6)
# nickname              {"abe"}
# email                 {"kkk@gmail.com"}
# password              {"00000000"}