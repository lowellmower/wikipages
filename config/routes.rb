Rails.application.routes.draw do
  
  root :to => 'contacts#index'

  resources :contacts do
    resources :phones
  end
  resources :phones
end