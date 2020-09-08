class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies, dependent: :destroy
  has_many :company_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :surname, :first_name, :surname_kana, :first_name_kana, :postal_code, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true, length: { maximum: 15 }
end
