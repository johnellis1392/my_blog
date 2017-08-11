Rails.application.routes.draw do
  # Make endpoints for individual model members (email, password, etc)
  # devise_for :users

  # Specify the methods you want to expose on a controller
  # resources :users, only: [:index]

  # Specify the controller you want to map to this resource
  # (supports nested controllers in child directories)
  # resources :users, controller: 'users/users'

  # Specify specific member of controller
  # resources :users do
  #   member do
  #     get :profile
  #   end
  # end

  # Remove routes from specified resource
  # resources :users, except: [:show]

  # Get a route on a member or collection within a resource
  # resources :users do
  #   get 'search', on: :collection
  #   get 'search', on: :member
  # end

  resources :posts do
    resources :comments, only: %i[index show], controller: 'posts/comments'
  end

  resources :users do
    # resources :posts, controller: 'users/posts' do
    #   resources :comments
    # end

    resources :posts, only: %i[index show], controller: 'users/posts' do
      resources :comments, only: %i[index show], controller: 'posts/comments'
    end

    # resources :comments

    # Custom route that acts on a single member:
    # GET /users/1/profile
    # member do
    #   get :profile
    # end

    # Custom route that acts on a collection:
    # GET /users/profile
    # collection do
    #   get :profile
    # end
  end

  # Route for fetching token for authentication
  get :token, controller: 'application'
  get :reauth, controller: 'application'
end
