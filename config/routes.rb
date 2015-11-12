Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show, :update]
      resources :invitations, only: [:create]
      resources :subscriptions, only: [:create] do
        post :unsubscribe, on: :collection
      end
      resources :topics, only: [:create]
      resources :proposals, only: [:create]
      resources :votes, only: [:create]
      resources :comments, only: [:create]
      post '/login', to: 'sessions#create'
    end
  end

end
