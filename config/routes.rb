Internship::Application.routes.draw do
  devise_for :admins
  root 'home#index'

  resources :form, only: [ :index, :show, :new, :create ]
  get 'form/:id/letter', to: 'letter#show'
end
