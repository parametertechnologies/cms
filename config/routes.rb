Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  root 'home#index',  as: :home

end
