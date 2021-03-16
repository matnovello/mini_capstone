class Api::CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      render "index.json.jb"
    else
      render json: { error: "you need to sign in" }
    end
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "removed",
    )
    @carted_product.save
    render "show.json.jb"
  end
end
