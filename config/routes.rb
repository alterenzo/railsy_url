Rails.application.routes.draw do
  resources :urls, only: [:create, :new, :show]
  root 'urls#new'
end
