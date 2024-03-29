class Api::ProductsController < ApplicationController
  # before_action :authenticate_user
  # before_action :authenticate_admin, only: [:destroy, :create, :update]

  def index
    # @products = Product.all
    # render "index.json.jb"

    # if params[:discount] == "true"
    #   @products = Product.where("price < 20")
    # elsif params[:sort] && params[:sort_order]
    #   @products = Product.order({ params[:sort] => params[:sort_order] })
    # else
    @products = Product.all
    # # # end
    # if params[:category]
    #   category = Category.find_by(name: params[:categories])
    #   @products = products.category
    # else
    #   @products = Product.all
    # end
    # # if current_user
    #   p "you are logged in as #{current_user.name}"
    # else
    #   p "error, no user"
    # end
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
      description: params[:description],
      supplier_id: params[:supplier_id],
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
