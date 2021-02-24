class Api::ProductsController < ApplicationController
  def all_products
    render "all_products.json.jb"
  end
end
