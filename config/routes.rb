Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  
  root 'welcome#index'

  devise_for :users, :controllers => {
    registrations: "registrations"
  }

  resources :users
  
end
