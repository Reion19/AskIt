Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create destroy update edit]
  end

  root 'pages#index'
end
