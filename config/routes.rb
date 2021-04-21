Rails.application.routes.draw do
  devise_for :users do
    resources :users, only: [:show]
  end

  root to: 'pages#home'
  get :dashboard, to: "pages#dashboard"

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
