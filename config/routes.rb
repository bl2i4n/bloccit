Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end
  #resource routing instead of multiple routes
  resources :advertisement


  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
