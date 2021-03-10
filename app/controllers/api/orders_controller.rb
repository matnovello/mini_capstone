class Api::OrdersController < ApplicationController
  def create
    if current_user
      order = Order.new(
        user_id: params[:user_id],
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        total: params[:total],
        tax: params[:tax],
      )
      order.save
      render json: { message: order }
    else
      render json: { message: "No User. Login to submit your order" }
    end
  end

  def index
    if current_user
      @orders = Order.all
      render "index.json.jb"
    else
      render json: { message: "Error, No User" }
    end
  end
end
