Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }

  resources :cultivated_areas

  resources :rates

  resources :contents

  resources :content_images

  resources :content_types

  resources :comments

  resources :notifications

  root 'notifications#predict'

  post 'notifications/predict' => 'notifications#get_predicted_diseases'

end
