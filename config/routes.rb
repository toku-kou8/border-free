Rails.application.routes.draw do
  root "public/homes#top"
  # devise_for :teacher, controllers: {
  #   sessions: 'teacher/sessions',
  #   passwords: 'teacher/passwords',
  #   registrations: 'teacher/registrations'
  # }
  # devise_for :student, controllers: {
  #   sessions: 'student/sessions',
  #   passwords: 'student/passwords',
  #   registrations: 'student/registrations'
  # }
  # devise_for :admin, controllers: {
  #   sessions: 'admin/sessions',
  #   passwords: 'admin/passwords',
  #   registrations: 'admin/registrations'
  # }
  devise_for :teachers
  devise_for :students
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    resources :teachers, only:[:index, :show]
    get '/about' => 'homes#about', as: 'about'
    get '/about/outline' => 'homes#show', as: 'outline'
    get '/social' =>'homes#social', as: 'social'
    get '/support' => 'homes#support', as: 'support'
    get '/classes' => 'homes#classes', as: 'classes'
  end
  scope module: :teacher do
    # devise_for :teachers, controllers: {
    #     sessions: 'teacher/sessions',
    #     regisrations: 'teacher/regisrations',
    #     passwords: 'teacher/passwords'
    #   }
  end
  namespace :teacher do
    get 'mypage' => 'homes#top', as: 'top'
    # get 'subject' => 'homes#edit', as: 'home_edit'
    resource :homes, only:[:edit, :update]
    post 'subject' => 'homes#create', as: 'homes_subject'
    delete 'subject/:id' => 'homes#destory', as: 'home_destroy'
    resources :students, only:[:index, :show]
    get 'students/result/:id' => 'students#result', as: 'result'
    resources :shifts, only: [:index, :create, :update, :destroy]
    resources :classes, only: [:index, :show, :update]
  end

  scope module: :admin do
    # devise_for :admins , controllers: {
    #   sessions: 'admin/sessions',
    #   regisrations: 'admin/regisrations',
    #   passwords: 'admin/passwords'
    # }
  end
  namespace :admin do
    resources :students, only:[:index, :show]
    resources :teachers, only:[:index, :show]
    resources :shifts, only: [:index, :update]
    get 'classes/subject' => 'classes#subject', as: 'subject'
    post 'classes/subject' => 'classes#subcreate', as: 'subjects'
    patch 'classes/subject/:id' => 'classes#subupdate', as: 'subject_update'
    delete 'classes/subject/:id' => 'classes#destory', as: 'subject_destroy'
  end

  scope module: :student do
    # devise_for :students, controllers: {
    #   sessions: 'student/sessions',
    #   regisrations: 'student/regisrations',
    #   passwords: 'student/passwords'
    # }
  end
  namespace :student do
    get 'mypage' => 'homes#index', as: 'show'
    get 'edit' => 'homes#edit', as: 'edit'
    patch 'students' => 'homes#update', as: 'update'
    resources :reservations, only:[:index, :create, :update, :destroy]
    resources :results, only: [:index, :new, :create, :edit, :update]
    resources :classes, only: [:index, :show, :create, :update]
  end

end
