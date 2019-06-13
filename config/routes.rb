# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  namespace :api do
    resources :cellules
    resources :machines
    resources :machine_types
    resources :rules
    resources :rule_steps
    resources :piece_parts
  end
end
