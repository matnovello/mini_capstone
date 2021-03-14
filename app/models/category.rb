class Category < ApplicationRecord
  has_many :product_categories
  belongs to :products, through: :product_categories
end
