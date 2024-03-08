class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: { message: "can't be blank" }
  validates :addresses, presence: { message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }, length: { minimum: 10, message: "is too short" }
  validates :user_id
  validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order_id)
  end

end