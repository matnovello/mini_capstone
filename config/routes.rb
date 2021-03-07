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
  end
  namespace :api do
    get "/suppliers" => "suppliers#index"
  end
end
