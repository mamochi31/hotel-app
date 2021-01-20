FactoryBot.define do
  factory :gest do
    gimei = Gimei.name
    name1_kana { gimei.last.katakana + gimei.first.katakana }
    phone_number { Faker::Number.number(digits: 11) }
    arr_date { Date.today }
    night { 1 }
    dep_date { arr_date + night }
    adult { 1 }
    number_of_room { 1 }
    room_type_id { 1 }
    plan_id { 1 }
    association :user
  end
end