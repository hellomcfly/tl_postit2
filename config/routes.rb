Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :posts, except: [:delete] do
    member do
      post 'vote'
    end

    resources :comments, only: [:create, :update] do
      member do
        post 'vote'
      end
    end

  end

  resources :users, only: [:index, :show, :new, :create]
  resources :categories, only: [:new, :create]

end