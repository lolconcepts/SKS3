Rails.application.routes.draw do

  resources :programs
  resources :messages
  #devise_for :students, path: 'students', controllers: {sessions: "students/sessions"}
  devise_for :users, path: 'users', controllers: {sessions: "users/sessions"}
resources :attendances

resources :class_slips

resources :dojos

resources :welcomes

resources :ranks

resources :students

resources :tuitions

resources :tuition

resources :admin


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
     match '/payment', :to => 'dashboard#payments', :via => :get
     match '/tuitions', :to => 'tuition#index', :via => :get
     match '/export', :to => 'students#export', :via => :get
     match 'alerts/', :to => 'admin#alerts', :via => :get
     match 'selfie/', :to => 'students#selfie', :via => :get
     match 'selfserve/', :to => 'admin#selfserve', :via => :get
   root 'admin#index'
   

  get ':controller(/:action(/:id))(.:format)'
end

