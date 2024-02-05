Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'shoes_reviews/new'
    get 'shoes_reviews/index'
    get 'shoes_reviews/edit'
    get 'shoes_reviews/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
# 顧客用
# URL /uses/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do #user가 맞는지 모르겠음 그리고 밑에 포스트에 users도 맞는지 모르겠음 to에 퍼블릭은 맞음
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
end
