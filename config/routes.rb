Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  resources :articles do
    resources :comments
  end

  get 'profile', to: 'profiles#show'
  root 'articles#index',  as: :home

end
