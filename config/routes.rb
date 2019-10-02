Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :pieces
  resources :games do
    member do
      put :join
    end
  end
end
