Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
<<<<<<< HEAD
  resources :games
  resources :pieces
=======
  resources :games do
    member do
      put :join
    end
  end
>>>>>>> 5567b055dbbeff4734e2cb16d9e1ff25da3f9ace
end
