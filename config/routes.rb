Rails.application.routes.draw do
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  get 'sobre', to: 'static_pages#sobre'
  get 'contacto', to: 'static_pages#contacto'
end
