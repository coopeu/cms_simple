SimpleCms::Application.routes.draw do

  # Don't need these auto-generated routes.
  # We are using default route.
  #   get "admin_users/index"
  #   get "admin_users/new"
  #   get "admin_users/edit"
  #   get "admin_users/delete"

  root "public#index"

  get 'show/:permalink', :to => 'public#show'
  get 'admin', :to => "access#index"

  #get "demo/index"
  match ':controller(/:action(/:id))', :via => [:get, :post]

 
end
