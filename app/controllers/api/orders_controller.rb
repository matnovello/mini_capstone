class Api::OrdersController < ApplicationController
  def create
    if current_user
      product = Product.find(params[:product_id])
      calculated_total = params[:quantity] * product.price

      order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        total: params[:total],
        tax: params[:tax],
      )
      order.save
      render "show.json.jb"
    else
      render json: { message: "No User. Login to submit your order" }
    end
  end

  def index
    if current_user
      p current_user
      p "CURRENT USER"
      @orders = Order.all
      render "index.json.jb"
    else
      render json: { message: "Error, No User" }
    end
  end

  def show
    if current_user
      @order = Order.find(params[:id])
      render "show.json.jb"
    else
      render json: { message: "Error, No User" }
    end
  end
end
