Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :users, except: [:index, :destroy]

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
  end

  namespace :admin do
    resources :users
    resources :categories
    root "users#index"
  end
end
