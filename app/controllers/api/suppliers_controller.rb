class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "supplier_index.json.jb"
  end
end
