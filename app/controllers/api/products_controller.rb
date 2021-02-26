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

  def create
    @product = Product.new({
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    })
    @product.save

    render "show.json.jb"
  end

  def update
    @id = params[:id]
    #gets product by it's id
    @product = Product.find_by(id: @id)
    #update product
    @product.name = params[:name]
    @product.price = params[:price]
    @products.description = params[:description]

    @product.save

    render "show.json.jb"
  end

  def destroy
    @id = params[:id]
    @product = Product.find_by(id: @id)
    @product.destroy
    render "show.json.jb"
  end
end
