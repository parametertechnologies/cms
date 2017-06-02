Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
  end

  resource :profile, only: [:show, :edit]
  root 'articles#index',  as: :home

end
