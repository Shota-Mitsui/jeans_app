Rails.application.routes.draw do
  get 'wellcome_pages/home'

  get 'wellcome_pages/help'

  root 'application#hello'
end
