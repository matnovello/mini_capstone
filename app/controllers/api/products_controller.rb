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
    if @product.save
      render "show.json.jb"
    else
      render json: { message: @product.errors.full_messages }
    end
  end

  def update
    @id = params[:id]
    #gets product by it's id
    @product = Product.find_by(id: @id)
    #update product
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.price

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @id = params[:id]
    @product = Product.find_by(id: @id)
    @product.destroy
    render json: { message: "destroy the boppa sean pizza" }
  end
end
