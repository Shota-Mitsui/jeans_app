Rails.application.routes.draw do
  root 'wellcome_pages#home'
  get '/help', to: 'wellcome_pages#help'
  get '/about', to: 'wellcome_pages#about'
  get '/contact', to: 'wellcome_pages#contact'
  get '/signup', to: 'users#new'
end
