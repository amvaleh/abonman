Rails.application.routes.draw do
  devise_for :people
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#home"

  get 'zarinpal' => 'home#pay'
  get 'aboneh' => 'home#pay'
  match '/pay' => 'zarinpal#pay', via: :post
  match '/pay' => 'zarinpal#pay', via: :get
  get 'zarinpal/:id' => 'zarinpal#verify'
  get '/profile' => 'home#profile'
  get '/:id' => 'home#redirect'
  post '/recover_password' => 'home#recover_password'

end
