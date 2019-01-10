Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/' => 'connect#join'
  root 'connect#index'
  resources :meetings
  resources :recordings
end
