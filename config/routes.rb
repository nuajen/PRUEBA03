Rails.application.routes.draw do
  resources :todos
  get 'todos/index'
  get 'todos/new'
  post 'todos', to: 'todos#create'
  get 'todos/:id', to: 'todos#show'
  get 'todos/:id/edit', to: 'todos#edit'
  patch 'todos/:id', to: 'todo#update'
  delete 'todos/:id', to: 'todo#destroy'

  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
