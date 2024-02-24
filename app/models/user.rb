class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :first_name_kanji,    presence: true
  validates :last_name_kanji,     presence: true
  validates :first_name_katakana, presence: true
  validates :last_name_katakana,  presence: true
  validates :birth_day,           presence: true
end
