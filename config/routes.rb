Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    resources :comments
  end
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 # get  '/help',    to: 'static_pages#help'
