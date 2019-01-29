Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    collection do
      post :confirm
      get :new_redirect
    end
  end
end
