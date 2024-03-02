FactoryBot.define do
  factory :item do
    name                   { Faker::Name.initials(number: 4) }
    info                   { Faker::Lorem.sentence(word_count: 100) }
    category_id            { (Category.pluck(:id) - [1]).sample }
    sales_status_id        { (SalesStatus.pluck(:id) - [1]).sample }
    shipping_fee_status_id { (ShippingFeeStatus.pluck(:id) - [1]).sample }
    prefecture_id          { (Prefecture.pluck(:id) - [1]).sample }
    scheduled_delivery_id  { (ScheduledDelivery.pluck(:id) - [1]).sample }
    price                  { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end