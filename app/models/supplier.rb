class Supplier < ApplicationRecord
  has_many :products

  def products
    return Product.where(supplier)
  end
end
