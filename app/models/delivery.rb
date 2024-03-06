class Delivery < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Please enter a 10 or 11-digit phone number" }
end
