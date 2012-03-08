Dreamer::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :dreams, only: [:index, :create, :update, :destroy]
  end
end
