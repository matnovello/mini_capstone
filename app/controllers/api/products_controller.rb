class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    @id = params[:id]
    @product = Product.find_by(id: @id)
    render "show.json.jb"
  end
end
