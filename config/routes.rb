Rails.application.routes.draw do
  devise_for :bus_owners
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # devise_for :users, controllers: { sessions: 'users/sessions' }
end
