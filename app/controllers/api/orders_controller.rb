class Api::OrdersController < ApplicationController
  def create
    if current_user
      order = Order.new(
        user_id: params[:user_id],
        product_id: params[:product_id],
        quantity: params{:quantity],

      )
    else
      render json: {message: "No User. Login to submit your order"}
    end
  end
end
