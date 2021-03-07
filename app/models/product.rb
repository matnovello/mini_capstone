class Product < ApplicationRecord
  #possible belongs to connection?
  belongs_to :supplier

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
    return
  end

  def show_supplier
    return "the name of this supplier is #{Supplier.find(supplier_id).name}"
  end
end
