Rails.application.routes.draw do
  resources :tr_rfq_submissions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/logout' => 'vendors#destroy_session'
  get '/unauthorized' => 'authentications#unauthorized'
  resources :worklists do
    member do
      get :decline
      get :verify
      patch :verify_vendor
      patch :decline_vendor
    end
  end

  resources :vendors do
    member do
      get :get_image
    end
  end
  resources :purchasings
  resources :tr_rfqs

  root to: 'worklists#index'
end
