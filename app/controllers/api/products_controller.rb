class Api::ProductsController < ApplicationController
  def all_products
    @all_products = Product.all
    render "all_products.json.jb"
  end

  def doreetis
    @doreetis = Product.first
    render "doreetis.json.jb"
  end

  def random
    @random = [Product.all.sample]
    render "random.json.jb"
  end
end
