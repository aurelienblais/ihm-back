# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  namespace :api do
    resources :cellules
  end
end
