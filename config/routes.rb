Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/products" => "products#all_products"
    get "/doreetis" => "products#doreetis"
    get "/random" => "products#random"
    get "/choose_product" => "products#display_products"
  end
end
