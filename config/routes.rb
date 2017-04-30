Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  #4
  resources :posts, only: [] do
    #5
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

  #resource routing instead of multiple routes
  # resources :advertisement
  post 'users/confirm' => 'users#confirm'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
