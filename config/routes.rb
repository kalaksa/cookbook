Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :comments
  end
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
