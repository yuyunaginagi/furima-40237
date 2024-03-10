FactoryBot.define do
  factory :order_delivery do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { (Prefecture.pluck(:id) - [1]).sample }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    phone_number  { Faker::Number.number(digits: rand(10..11)).to_s }
  end
end
