class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true 
  validates :name,  presence: true
  validates :info,  presence: true
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank" }
  validates :sales_status_id,        numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :scheduled_delivery_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true,  format: { with: /\A\d+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  def was_attached?
    self.image.attached?
  end
end
