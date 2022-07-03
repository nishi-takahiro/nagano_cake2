Rails.application.routes.draw do
 
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    
    
    devise_for :admin,skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :items, only:[:index, :show]
  end

  namespace :public do
    get '/orders/confirm' => 'orders#confirm'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    get 'customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/unsubscribe' => 'customers#withdraw', as: 'withdraw'
    delete 'addresses/destroy' => 'address#destroy', as: 'destroy'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :update, :index, :show, :complete]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :withdraw]
    resources :items, only:[:index, :show]
    
  end
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
 
end