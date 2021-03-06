Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'teacher_signup', to: 'teachers#new'
  resources :teachers, only: [:show, :create] do
    resources :bookings, only: [:new]
  end
  
  get '/cancel/:id', to: 'bookings#destroy', as: 'cancel'
  resources :bookings, only: [:create, :show, :update]

  get 'student_signup', to: 'students#new'
  resources :students, only: [:show, :create]
  
  get 'teacher_login', to: 'teacher_sessions#new'
  post 'teacher_login', to: 'teacher_sessions#create'
  delete 'teacher_logout', to: 'teacher_sessions#destroy'
  
  get 'student_login', to: 'student_sessions#new'
  post 'student_login', to: 'student_sessions#create'
  delete 'student_logout', to: 'student_sessions#destroy'
  
  resources :teacher_profiles, only: [:new, :create, :show, :index, :edit, :update]
  resources :student_profiles, only: [:new, :create, :show, :edit, :update]
  
  get 'search', to: 'teacher_profiles#search'
  get 'me', to: 'teacher_profiles#me'
  
end
