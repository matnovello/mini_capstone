class Product < ApplicationRecord
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
end
