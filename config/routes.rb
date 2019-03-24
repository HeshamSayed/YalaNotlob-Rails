Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
      sessions: 'users/sessions'}
  root to: 'home#index'
  resources :orders do
    resources :details
  
  end
  get '/addGroup', :controller => 'groups', :action => 'add'
  post '/addGroup', :controller => 'groups', :action => 'addgroup'
  get '/addGroupMember', :controller => 'groups', :action => 'groupmember'
  post '/addMember' , :controller =>'groups' , :action =>'addmember'
  resources :groups
  # get 'group/delete' , :controller => 'groups', :action => 'delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
