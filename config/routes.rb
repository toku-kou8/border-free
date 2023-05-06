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
  end

  namespace :teacher do
    get 'teachers/mypage' => 'teacher/homes#top', as: 'top'
    resources :students, only:[:index, :show]
    get 'teachers/students/result/:id' => 'teacher/students#result', as: 'result'
    resources :shifts, only: [:index, :create, :update]
    resources :classes, only: [:index, :show]
  end

  namespace :admin do
    resources :students, only:[:index, :show]
    resources :teachers, only:[:index, :show]
    resources :shifts, only: [:index, :update]

  end

  namespace :student do
    get 'students/mypage' => 'student/homes#show', as: 'show'
    get 'students/edit' => 'student/homes#edit', as: 'edit'
    patch 'students' => 'student/homes#update', as: 'update'
    resources :reservations, only:[:index, :create, :update]
    resources :results, only: [:index, :new, :create, :edit, :update]
    resources :classes, only: [:index, :show, :create, :update]
  end

end
