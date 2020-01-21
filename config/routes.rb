Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages
  
  mount ActionCable.server, at: '/cable'
end
