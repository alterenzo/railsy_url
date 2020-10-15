Rails.application.routes.draw do
  resources :urls, only: [:create, :new, :show], path: '/'
  root 'urls#new'
end
