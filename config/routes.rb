Rails.application.routes.draw do
  root 'wellcome_pages#home'
  get 'wellcome_pages/help'
  get 'wellcome_pages/about'
end
