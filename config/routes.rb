Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[create destroy update edit]
  end

  root "pages#index"
end
