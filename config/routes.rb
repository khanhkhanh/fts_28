Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :users, except: [:index, :destroy]
  resources :questions, only: [:index]
  resources :exams, except: :destroy
  resources :categories, only: [:index] do
    resources :exams, only: [:new, :create, :show]
  end

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
  end

  namespace :admin do
    resources :users
    resources :categories
    resources :exams, except: [:edit, :update]
    resources :questions
    root "exams#index"
  end
end
