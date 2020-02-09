Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages

  resources :expenses
  
  mount ActionCable.server, at: '/cable'
end
