Rails.application.routes.draw do

    resources :buses do
      resources :reservations
    end
  
  devise_scope :user do
    get 'user_login', to: 'users/sessions#new'
    get 'user_signup', to: 'users/registrations#new'
    get 'profile_edit', to: 'users/registrations#edit'
    get 'profile', to: 'users#show'
    delete 'profile_deactivate', to: 'users#destroy'
    
  end
  

  devise_scope :bus_owner do
    get 'bus_owner_login', to: 'bus_owners/sessions#new'
    get 'bus_owner_signup', to: 'bus_owners/registrations#new'
    get 'bus_owner_profile_edit', to: 'bus_owners/registrations#edit'
    get 'bus_owner_profile', to: 'bus_owners#show'
    get 'bus_owner_index', to: 'bus_owners#index'
    get 'bus_owner_index_active', to: 'bus_owners#active'
    delete 'bus_owner_profile_deactivate', to: 'users#destroy'
  end

  devise_for :bus_owners
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "buses#index"

end
