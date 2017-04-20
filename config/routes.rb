Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end
  #resource routing instead of multiple routes
  # resources :advertisement
  post 'users/confirm' => 'users#confirm'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
