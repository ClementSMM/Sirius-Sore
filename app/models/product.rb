class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :stocks, dependent: :destroy
  has_many_attached :images

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :small_description, presence: true
  validates :categories, presence: true
end
