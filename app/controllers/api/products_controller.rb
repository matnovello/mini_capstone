class Api::ProductsController < ApplicationController
  def all_products
    @all_products = Product.all
    render "all_products.json.jb"
  end

  def doreetis
    @doreetis = Product.find_by(id: 1)
    render "doreetis.json.jb"
  end

  def random
    @random = [Product.all.sample]
    render "random.json.jb"
  end

  def display_product
    @display_product = Product.find_by(id: params[:id])
    render "product.json.jb"
  end
end
