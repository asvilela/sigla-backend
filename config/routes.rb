require 'api_version_constraint'

Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/sessions' }

  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do

  #   namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
  #     resources :users, only: [:show, :create, :update, :destroy]
  #     resources :sessions, only: [:create, :destroy]
  #   end

  # end

  # devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/sessions' }

  namespace :api, defaults: { format: :json }, path: '/' do

    namespace :v1, path: '/' do

      mount_devise_token_auth_for 'User', at: 'auth'

      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :companies, only: [:show, :create, :update, :destroy]
      resources :enterprises, only: [:show, :create, :update, :destroy]
      resources :folders, only: [:show, :create, :update, :destroy]
      resources :documents, only: [:show, :create, :update, :destroy]
      resources :conditionals, only: [:show, :create, :update, :destroy]
      resources :tasks, only: [:show, :create, :update, :destroy]
      resources :evidences, only: [:show, :create, :update, :destroy]

      namespace :domains do
        resources :company_types, only: [:index]
        resources :enterprise_types, only: [:index]
        resources :features, only: [:index]
        resources :phases, only: [:index]
        resources :content_types, only: [:index]
        resources :conditional_statuses, only: [:index]
        resources :conditional_types, only: [:index]
        resources :recurrence_types, only: [:index]
        resources :task_statuses, only: [:index]
        resources :priorities, only: [:index]
        resources :evidence_types, only: [:index]
      end

    end

  end

end
