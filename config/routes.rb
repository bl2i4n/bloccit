Rails.application.routes.draw do

  #resource routing instead of multiple routes
  resources :advertisement
  resources :questions
  #1
  resources :posts

  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
