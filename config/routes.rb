Rails.application.routes.draw do

  get 'homepage/homeindex'
  get 'home/index'
  devise_for :users, controllers: {
      sessions: 'users/sessions'}

  root to: 'home#index'
  resources :orders do
    resources :details
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
