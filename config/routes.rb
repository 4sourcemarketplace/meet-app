Rails.application.routes.draw do

  resources :groups do
    resources :roles
    collection { post :import }
  end

  root to: "groups#home"


end
