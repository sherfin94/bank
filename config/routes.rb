Rails.application.routes.draw do
  get 'loans/index'

  get 'loans/show'

  get 'loans/new'

  #resources :loans

  post 'loans/progress'
  post 'loans', to: 'loans#create'
  get 'loans/payment_schedule/', to: 'loans#payment_schedule'

  root 'loans#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
