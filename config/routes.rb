Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    #index
    get "/products" => "products#index"
    #show product by id
    get "/products/:id" => "products#show"
    #create product in db
    post "/products/create" => "products#create"
    #update product
    patch "/products/:id" => "products#update"

    delete "/products/:id" => "products#destroy"

    get "/suppliers" => "suppliers#index"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    #create order
    post "/orders" => "orders#create"
    #index
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"

    #cartedproducts
    post "/carted_products" => "carted_products#create"
  end
end
