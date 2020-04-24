Rails.application.routes.draw do
  resources :searches
  root 'home#index'

  resources :albums
  
  resources :albums do
    member do
    delete :delete_upload
    end
  end

  devise_for :users, controllers: { registrations: "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
