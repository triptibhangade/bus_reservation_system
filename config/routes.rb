Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "buses#index"
  get 'search' => "buses#index"
  get 'book_seat' => "reservations#book_seat"
  get 'cancel_reservation/:id' => "reservations#cancel", as: :cancel_reservation

  namespace :admin do
    get 'customers' => "users#index"
    get 'profile' => "users#show"
    resources :bus_owners do
      member do
        get 'show'
        get 'active'
        get 'suspend'
        delete 'reject'
      end
    end
    resources :reservations do
      member do
        get 'cancel'
      end
    end
  end

  namespace :bus_owners do
    get 'profile' => "bus_owners#show"
    resources :buses do
      member do
        get "show"
      end
    end
  end
  
  resources :buses do
    resources :reservations do
      resources :seats
    end
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
    # get 'bus_owner_profile', to: 'bus_owners#show'
    get 'bus_owner_index', to: 'bus_owners#index'
    delete 'bus_owner_profile_deactivate', to: 'bus_owners#destroy'
  end

  devise_for :bus_owners
  devise_for :users

end
