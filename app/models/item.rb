class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :items_name, :string, presence: true
  validates :explanation, :text, presence: true
  validates :Category_id,        numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id,   numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, :integer, presence: true
end
