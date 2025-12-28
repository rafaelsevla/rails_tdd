Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :customers
  root to: "welcome#index"
end
