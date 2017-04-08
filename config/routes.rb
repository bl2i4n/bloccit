Rails.application.routes.draw do

  resources :advertisements

  #1
  resources :posts

  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
