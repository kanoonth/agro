Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }

  resources :cultivated_areas

  resources :rates

  resources :contents

  resources :content_images

  resources :content_types

  resources :comments

  resources :notifications

  # resources :provinces

  # resources :region_certainty_factors

  # resources :regions

  # resources :temperatures

  # resources :rains

  # resources :winds

  # resources :ecology_certainty_factors

  # resources :ecologies

  # resources :air_moistures

  # resources :soil_moistures

  # resources :area_type_certainty_factors

  # resources :area_types

  # resources :plantation_certainty_factors

  # resources :plantations

  # resources :soil_type_certainty_factors

  # resources :soil_types

  # resources :stage_certainty_factors

  # resources :disease_names

  # resources :potassia

  # resources :phosphorus

  # resources :stages

  # resources :diseases

  # resources :nitrogens

  root 'notifications#predict'

  post 'notifications/predict' => 'notifications#get_predicted_diseases'

end
