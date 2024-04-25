Rails.application.routes.draw do
  root "public/homes#top"
  devise_for :admins
  # devise_for :admins, controllers: {
  #   sessions: "admins/sessions",
  #   passwords: "admins/passwords"
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    resources :teachers, only:[:index, :show]
    get '/about' => 'homes#about', as: 'about'
    get '/about/outline' => 'homes#show', as: 'outline'
    get '/social' =>'homes#social', as: 'social'
    get '/support' => 'homes#support', as: 'support'
    get '/classes' => 'homes#classes', as: 'classes'
    get '/privacy' => 'homes#privacy', as: 'privacy'
    resources :contacts, only: [:new, :create]
    resources :medias, only: [:index]
  end

  namespace :admin do
    # resources :contacts, only: [:index, :show]
    resources :medias,only: [:index,:edit,:update,:create,:destroy]
  end

end
