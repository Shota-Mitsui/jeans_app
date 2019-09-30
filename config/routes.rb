Rails.application.routes.draw do
  root 'wellcome_pages#home'
  get '/help', to: 'wellcome_pages#help'
  get '/about', to: 'wellcome_pages#about'
  get '/contact', to: 'wellcome_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
