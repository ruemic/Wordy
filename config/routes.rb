Wordy::Application.routes.draw do
  root to: 'home#index'
  get '/manifest.appcache' => 'home#manifest', format: :appcache

  namespace :api do
    resources :words, only: [:index, :create, :update, :destroy]
  end

end
