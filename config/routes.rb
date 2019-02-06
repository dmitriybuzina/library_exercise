Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :books
end