Rails.application.routes.draw do
  devise_for :users

  resources :comics do
    resources :pages, except: :show do
      resources :elements
    end
  end

  resources :documentation, only: :index

  root "comics#index"
end
