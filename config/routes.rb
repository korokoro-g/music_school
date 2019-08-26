Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'teacher_signup', to: 'teachers#new'
  resources :teachers, only: [:show, :create]

  get 'student_signup', to: 'students#new'
  resources :students, only: [:show, :create]
  
  get 'teacher_login', to: 'teacher_sessions#new'
  post 'teacher_login', to: 'teacher_sessions#create'
  delete 'teacher_logout', to: 'teacher_sessions#destroy'
  
  resources :teacher_profiles, only: [:new, :create, :show, :index, :edit, :update]
end
