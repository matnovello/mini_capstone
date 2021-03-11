class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:destroy, :create, :update]

  def create
    if current_user
      product = Product.find(params[:product_id])

      calculated_subtotal = params[:quantity].to_i * product.price
      calculated_tax = params[:quantity].to_i * product.tax
      calculated_total = calculated_subtotal + calculated_tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        total: calculated_total,
        tax: calculated_tax,
      )
      @order.save
      render "show.json.jb"
    else
      render json: { message: "No User. Login to submit your order" }
    end
  end

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
    else
      render json: { message: "Error, No User" }
    end
  end

  def show
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id
      render "show.json.jb"
    else
      render json: { message: "#{current_user.name}
       does not match #{@order.user.name}" }
    end
  end
end
