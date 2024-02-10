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
    get 'review_comments', to: "review_comments#index"
  end

  namespace :public do
    resources :shoes_reviews do
      resource :favorite, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    # resources :users, only: [:edit, :update, :show]
    get 'homes/top'
    get 'homes/about'

    get "users/:id/mypage", to: "users#show", as: 'users_mypage'
    get "users/information/edit", to: "users#edit"
    patch "users/information", to: "users#update"
    get 'users/unsubscribe', to: "users#unsubscribe"
    patch 'users/withdraw', to: "users#withdraw"
    get '/users/:id/favorites', to: 'users#favorites', as: 'users_favorites'

    get "search" => "searches#search"
    # タグの検索で使用する
    get "search_tag" => "shoes_reviews#search_tag"

  end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do #user가 맞는지 모르겠음 그리고 밑에 포스트에 users도 맞는지 모르겠음 to에 퍼블릭은 맞음
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

end
