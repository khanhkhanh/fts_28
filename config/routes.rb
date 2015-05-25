Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "categories#index"
    resources :categories
  end
end
