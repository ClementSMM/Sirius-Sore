Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get :dashboard, to: "pages#dashboard"
  get :about, to: "pages#about"
  get :contact, to: "pages#contact"
  get :salon, to: "pages#salon"
  get :cosmetiques, to: "categories#cosmetiques"
  get :friandises, to: "categories#friandises"
  get :accessoires, to: "categories#accessoires"
  get :paniers, to: "categories#paniers"
  get :vetements, to: "categories#vetements"
  get :jeux, to: "categories#jeux"
  get :gamelles, to: "categories#gamelles"
  get :transports, to: "categories#transports"
  get :success, to: 'payments#success'
  get :fail, to: 'payments#fail'
  get :hidden_products, to: 'products#hidden_products'

  resources :products do
    member do
      delete :delete_image_attachement
    end
  end

  resources :orders do
    resources :payments, only: :new
  end

  post '/orders/:id/pay', to: 'orders#pay', as: :order_pay

  resources :galleries do
    member do
      delete :delete_image_attachement
    end
  end

  resources :categories
  resources :order_items do
    post '/add-one', to: 'order_items#add_one'
    post '/remove-one', to: 'order_items#remove_one'
    post '/remove-all', to: 'order_items#remove_all'
  end

  resources :stocks

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
