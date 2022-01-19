Rails.application.routes.draw do
  resources :restaurants, only: %i[index new create show] do
    resources :reviews, only: %i[new create]
  end
end
