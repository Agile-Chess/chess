<<<<<<< HEAD
Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :games
end
=======
Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :games
end


>>>>>>> 0ce1168d22a70a51e2372aea2bd59e49de923fb8
