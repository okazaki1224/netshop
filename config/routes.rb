Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :public do
    resources :addresses,only:[:index, :edit, :update, :destroy, :create]
    #get 'addresses/index'
    #get 'addresses/edit'
    #get 'addresses/create'
    #get 'addresses/update'
    #get 'addresses/destroy'
  end
  namespace :public do
    resources :orders,only:[:new, :index, :create, :show]
    #get 'orders/new'
    #get 'orders/index'
    #get 'orders/create'
    #get 'orders/show'
    resources :orders,only:[:confirm, :complete] do
      collection do
        post 'confirm'
      end
      collection do
        get 'complete'
      end
    end
  end
  namespace :public do
    resources :cart_items,only:[:index, :update, :destroy, :create]
    #get 'cart_items/index'
    #get 'cart_items/update'
    #get 'cart_items/destroy'
    #get 'cart_items/create'
    resources :cart_items,only:[:delete_all] do
      collection do
        delete 'destroy_all'
      end
    end
  end
  namespace :public do
    get 'customers/my_page' => 'customers#show', as:"my_page"
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/information' => 'customers#update'
    #get 'customers/unsubscribe' => 'customers#unsubscribe'
    #get 'customers/withdraw' => 'customers#withdraw'
    resources :customers,only:[:unsubscribe, :withdraw] do
      collection do
        get 'unsubscribe'
      end
      collection do
        patch 'withdraw'
      end
    end
  end
  namespace :public do
    resources :items, only:[:index, :show]
    #get 'items/index'
    #get 'items/show'
  end
  namespace :public do
    #get 'homes/top'
    #get 'homes/about'
    root to: 'homes#top'
    get '/about' => 'homes#about',as:'about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#1行目のdoに対応するので消さないこと