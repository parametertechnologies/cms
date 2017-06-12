Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
  end

  resource :profile, only: [:show, :edit, :update]
  resources :site_configurations
  root 'articles#index',  as: :home

end
