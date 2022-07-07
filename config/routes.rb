Rails.application.routes.draw do
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
   resources :order_details, only:[:update]
    #patch 'order_details/update'

   resources :orders, only:[:show, :update]
    #get 'orders/show'
    #patch 'orders/update'

   resources :customers, only:[:index, :show, :edit, :update]
    #get 'customers' => 'customers#index'
    #get 'customers/show'
    #get 'customers/edit'
    #patch 'customers/update'

   resources :genres, only:[:index, :create, :edit, :update]
    #get 'genres' => 'genres#index'
    #post 'genres/create'
    #get 'genres/edit'
    #patch 'genres/update'

   resources :genres, only:[:index, :new, :create, :show, :edit, :update]
    #get 'items' => 'items#index'
    #get 'items/new'
    #post 'items/create'
    #get 'items/show'
    #get 'items/edit'
    #patch 'items/update'

    get 'homes/top'
  end

  scope module: :public do
    resources :items, only:[:index, :show]
    resources :cart_items,only:[:index, :update, :destroy, :create]
    resources :orders,only:[:new, :index, :create, :show]
    resources :addresses,only:[:index, :edit, :update, :destroy, :create]
  end

    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'

    post '/orders/confirm' => 'public/orders#confirm'
    get '/orders/complete' => 'public/orders#complete'

    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'

    get 'customers/my_page' => 'public/customers#show', as:"my_page"
    get 'customers/information/edit' => 'public/customers#edit'
    patch 'customers/information' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#1行目のdoに対応するので消さないこと