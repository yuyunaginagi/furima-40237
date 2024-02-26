class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  validates :items_name,  presence: true
  validates :explanation, presence: true
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id,   numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, format: { with: /\A\d+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
