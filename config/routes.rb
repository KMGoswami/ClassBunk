Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :posts
  root to: 'pages#home'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        regestrations: 'users/regestrations'

      }

      devise_scope :user do
        get 'sign_up', to: 'users/regestrations#new'
        get 'sign_in', to: 'users/sessions#new'
        get 'sign_out', to: 'users/sessions#delete'
        delete 'logout', to: 'devise/sessions#destroy'
        get 'post', to: 'post#new'
        post 'allUsers', to: 'pages#allUsers' , as: :allUsers
        get 'allUsers', to: 'pages#allUsers'
      end

end
