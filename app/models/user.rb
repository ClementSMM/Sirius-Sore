class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :encrypted_password, uniqueness: true
  # validates :city, presence: true
  # validates :address_1, presence: true
  # validates :post_code, presence: true
end
