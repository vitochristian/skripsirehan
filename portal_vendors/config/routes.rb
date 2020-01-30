# frozen_string_literal: true

Rails.application.routes.draw do

  resources :tr_rfq_submission_dtls
  resources :tr_rfqs
  resources :tr_rfq_submissions
  authenticated :ms_vendor do
    root to: 'inquiries#index', as: :authenticated_root
  end
  root to: redirect('/login')

  devise_for :ms_vendors, path: '', controllers: {
    registrations: 'ms_vendors/registrations', passwords: 'ms_vendors/passwords'
  }, path_names: { sign_in: :login, sign_up: :register, password: :reset, confirmation: :verification }

  namespace :api do
    resources :images, only: :show do
      member do
        get :check_path
        get :get
      end
    end
  end

  resources :vendors do
    member do
      patch :update_password
    end
  end
  resources :inquiries
  resources :products_and_services, only: [:index, :update] do    
    member do
      get :download_template
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
