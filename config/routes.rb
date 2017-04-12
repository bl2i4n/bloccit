Rails.application.routes.draw do
  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  resources :topics do
    resources :sponsored_posts
  end

  resources :topics do
    resources :posts, except: [:index]
  end
  #resource routing instead of multiple routes
  resources :advertisement


  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
