Rails.application.routes.draw do
  devise_for :users

  resources :rooms

  devise_scope :user do 
    get 'users', to: 'devise/sessions#new'
  end
  
  root "pages#index"

  get 'user/:id', to: 'users#show', as: 'user'
end
