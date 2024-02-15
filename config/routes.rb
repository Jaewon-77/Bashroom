Rails.application.routes.draw do
  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /uses/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    #get 'review_comments', to: "review_comments#index"
    #get 'review_shoes_reviews', to: "review_shoes_reviews#index"
    resources :review_comments, only: [:index, :destroy]
    resources :review_shoes_reviews, only: [:index, :destroy]
  end

  namespace :public do
    resources :shoes_reviews do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    # resources :users, only: [:edit, :update, :show]
    get 'homes/top'
    get 'homes/about'

    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      # member do
      #   get 'favorites'
      # end
    end

    #get "users/:id/mypage", to: "users#show", as: 'users_mypage'
    get "users/information/edit", to: "users#edit"
    patch "users/information", to: "users#update"
    get 'users/unsubscribe', to: "users#unsubscribe"
    patch 'users/withdraw', to: "users#withdraw"
    get '/users/:id/favorites', to: 'users#favorites', as: 'users_favorites'
    get '/users/:id/user_shoes_reviews', to: 'users#user_shoes_reviews', as: 'users_user_shoes_reviews'

    get "search" => "searches#search"
    # タグの検索で使用する
    get "search_tag" => "shoes_reviews#search_tag"



  end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

end
