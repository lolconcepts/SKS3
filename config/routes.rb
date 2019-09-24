Rails.application.routes.draw do

  devise_for :users
resources :attendances

resources :class_slips

resources :dojos

resources :welcomes

resources :ranks

resources :students

resources :tuitions


# The priority is based upon order of creation:
# first created -> highest priority.
# Sample of regular route:
     match 'setup/', :to => 'dojos#index', :via => :get
     match 'reset/', :to => 'welcomes#reset_sandbox', :via => :get
     match 'demo/', :to => 'welcomes#do_demo', :via => :get
     match 'removepic/', :to => 'students#remove_pic', :via => :get
     match 'addme/', :to => 'students#addme', :via => :get
     match 'identity/',:to => 'students#identity', :via => :get
     match 'attend/', :to => 'attendances#attend', :via => :get
	 match 'list/', :to => 'students#list', :via => :get
   
   
   root 'welcomes#index'
   

  get ':controller(/:action(/:id))(.:format)'
end

