class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  def is_discounted?
    if price < 10
      # is_discounted? == true
      return true
    else
      return false
    end
  end

  def tax
    return (price * 0.09)
  end

  def total
    return price + tax
  end
end
