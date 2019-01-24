Rails.application.routes.draw do
  resources :lists do
    collection do
      post :confirm
    end
  end
end
