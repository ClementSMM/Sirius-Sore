class Product < ApplicationRecord
  include PgSearch::Model

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :stocks, dependent: :destroy
  has_many_attached :images

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :small_description, presence: true
  validates :categories, presence: true

  pg_search_scope :global_search,
    against: [ :name, :long_description, :small_description ],
    associated_against: {
      categories: [ :name]
    },
    using: {
      tsearch: { prefix: true }
    }

end
