Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show, :update]
      resources :invitations, only: [:create]
      resources :subscriptions, only: [:create]
      post '/login', to: 'sessions#create'
    end
  end

end
