Rails.application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }

  resources :cultivated_areas

  resources :rates, except: [:edit, :update]

  resources :contents, except: [:edit, :update]

  resources :comments, except: [:edit, :update]

  resources :notifications, except: [:edit, :update]

  root 'profiles#home'

  post 'notifications/predict' => 'notifications#get_predicted_diseases'

  get 'profile' => 'profiles#profile'

end
