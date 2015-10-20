Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show, :update]
      post '/login', to: 'sessions#create'
    end
  end

end
