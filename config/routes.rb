Rails.application.routes.draw do
  resources :lists do
    collection do
      post :confirm
      get :new_redirect
    end
  end
end
