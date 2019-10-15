Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :games do
  resources :pieces
    member do
      put :join
    end
  end
  resources :games do
    member do
      put :forfeit
    end
  end


end