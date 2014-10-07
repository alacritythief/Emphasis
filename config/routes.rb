Rails.application.routes.draw do
  devise_for :users

  resources :comics do
    resources :pages do
      resources :elements
    end
  end

  root "comics#index"
end
