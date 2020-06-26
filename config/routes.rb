Rails.application.routes.draw do
  #resources :todos
  resources :categories

  post 'todos' => 'todos#create'

#  post 'todos' => ''

  get 'projects' => 'project#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'project#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
