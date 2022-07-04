Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

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
    get 'customers/information' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    get 'customers/withdraw' => 'public/customers#withdraw'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#1行目のdoに対応するので消さないこと