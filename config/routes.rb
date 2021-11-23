Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals #create a new action 
  get   '/symptoms',  to: 'symptoms#index'
  resources :consultations, only: [:index, :new, :create, :show] do
    resources :prescriptions, only: [:index, :new, :create, :show, :edit]
  end
end
