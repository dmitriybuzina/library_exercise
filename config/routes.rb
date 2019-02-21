Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :books do
    resources :comments
    post 'take_return', on: :member
    # post 'return', on: :member
    post 'new_like', on: :member
    delete 'delete_like', on: :member
  end
end
