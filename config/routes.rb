Rails.application.routes.draw do
  resources :questions # the same thing as line below
  # resources :questions, only: %i[index new edit create update destroy show]

  root "pages#index"

  # get "/questions", to: "questions#index"
  # get "/questions/new", to: "questions#new"
  # post "/questions", to: "questions#create"
  # get "questions/:id/edit", to: "questions#edit" => will be created with resources method
end
