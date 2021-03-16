class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:destroy, :create, :update]

  def create
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      p @carted_products
      calculated_subtotal = 0
      calculated_tax = 0
      calculated_total = 0
      @carted_products.each do |carted_product|
        calculated_subtotal += carted_product.product.price * carted_product.quantity
        calculated_tax += carted_product.product.tax * carted_product.quantity
        calculated_total += calculated_subtotal + calculated_tax
      end
      p "calculated subtotal is #{calculated_subtotal}"
      p calculated_tax
      p calculated_total

      # @order = Order.new(
      #   user_id: current_user.id,
      #   # quantity: carted_product.quantity,
      #   # subtotal: calculated_subtotal,
      #   # total: calculated_total,
      #   # tax: calculated_tax,
      # )
      # @order.save!
      # render "show.json.jb"
      # else
      #   render json: { message: "No User. Login to submit your order" }
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
