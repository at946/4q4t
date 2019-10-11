Rails.application.routes.draw do
  resources :teams, only: [:show, :new, :create], param: :uid

  root to: 'common#index'
end
