Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :games do
    member do
      put :forfeit
    end
  end
  resources :pieces do
    member do
      put :join
    end
  end
  resources :pieces, only: :update
  
end