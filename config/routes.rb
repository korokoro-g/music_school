Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'teacher_signup', to: 'teachers#new'
  resources :teachers, only: [:show, :create]

  get 'student_signup', to: 'students#new'
  resources :students, only: [:show, :create]
end
