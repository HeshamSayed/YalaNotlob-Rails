Rails.application.routes.draw do

  get 'homepage/homeindex'
  get 'home/index'
  mount ActionCable.server => "/cable"
  #devise_for :users, controllers: {  sessions: 'users/sessions'}

  devise_for :users, :controllers => {sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
  


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
  resources :friends
  delete 'removemember/:id(.:format)', :to => 'groups#removemember'
  delete 'destroy/:id(.:format)' , :to =>'orders#destroy'
  put 'update/:id(.:format)' , :to =>'orders#update'
  #mhdesh yshlhom
  get '/addFriend' , :controller => 'friends', :action => 'add'
  post '/addFriend' , :controller =>'friends' , :action =>'addfriend'
  get '/friendActivity' , :controller => 'home', :action => 'friendactivity'
  # get 'group/delete' , :controller => 'groups', :action => 'delete'

  get '/test', :controller => 'orders', :action => 'test'
  get '/group', :controller => 'orders', :action => 'group'
  post '/save', :controller => 'orders', :action => 'save'
  get '/member', :controller => 'orders', :action => 'member'
  #get '/save', :controller => 'orders', :action => 'saveadd'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
