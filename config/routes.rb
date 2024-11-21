Rails.application.routes.draw do
  devise_for :users
  root to: "islands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/dashboard", to: "dashboard#index"

  resources :islands, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :show, :new, :create,:edit, :update]
  end

  resources :bookings, only: [:index, :show]

  namespace :owner do
    resources :bookings, only:[] do
      member do
        patch :accept
        patch :refuse
      end
    end

    resources :islands, only: [:index, :edit, :update] do
      member do
        delete :delete_photo
      end
    end
  end
end
