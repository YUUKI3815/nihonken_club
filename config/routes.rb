Rails.application.routes.draw do
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: "about"
  #ユーザー用devise
  devise_for :users,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  #管理者用devise
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  # ユーザー用
  scope module: :public do
    get '/users/my_page' => 'users#show'
    resources :users, only: [:edit, :update]
    resources :pets, only: [:index, :create, :edit, :update, :destroy]
    resources :dog_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end
  end

# 管理者用
 namespace :admin do
  resources :users, only: [:index, :show, :edit, :update]
  resources :dog_breeds, only: [:index, :create, :edit, :update]
 end
end
