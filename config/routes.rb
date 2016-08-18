Rails.application.routes.draw do
  get 'loan_requests/index'

  get 'loan_requests/show'

  get 'loan_requests/new'

  resources :loan_requests

  post 'loan_requests/progress'

  root 'loan_requests#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
