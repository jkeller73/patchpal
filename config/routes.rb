Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :plants, only: [:index, :show]
  resources :patches do
    resources :patch_plants, only: [:create, :destroy]
  end
  devise_for :users
end
