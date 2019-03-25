Rails.application.routes.draw do

  get 'homepage/homeindex'
  get 'home/index'
  devise_for :users, controllers: {
     sessions: 'users/sessions'}

  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'home#index'
  # root to: 'homepage#homeindex'
  resources :orders do
    resources :details
  end
  get '/addGroup', :controller => 'groups', :action => 'add'
  post '/addGroup', :controller => 'groups', :action => 'addgroup'
  get '/addGroupMember', :controller => 'groups', :action => 'groupmember'
  post '/addMember' , :controller =>'groups' , :action =>'addmember'
  resources :groups
  delete 'removemember/:id(.:format)', :to => 'groups#removemember'

  get '/addFriend' , :controller => 'friends', :action => 'add'
  post '/addFriend' , :controller =>'friends' , :action =>'addfriend'
  # get 'group/delete' , :controller => 'groups', :action => 'delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
