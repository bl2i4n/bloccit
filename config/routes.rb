Rails.application.routes.draw do

  #resource routing instead of multiple routes
  resources :advertisement

  #1
  resources :posts

  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
