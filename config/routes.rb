Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :books do
    post 'new_history', on: :member
    delete 'delete_history', on: :member
  end
end