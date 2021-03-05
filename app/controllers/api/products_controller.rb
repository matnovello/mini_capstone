class Api::ProductsController < ApplicationController
  def index
    # @products = Product.all
    # render "index.json.jb"
    if params[:discount] == "true"
      @products = Product.where("price < 20")
    elsif params[:sort] == "price" && params[:sort_order] == "asc"
      @products = Product.order({ price: :asc })
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = Product.order({ price: :desc })
    else
      @products = Product.all
    end
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
