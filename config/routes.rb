Rails.application.routes.draw do

  resources :advertisement
  #1
  resources :posts

  #2
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
