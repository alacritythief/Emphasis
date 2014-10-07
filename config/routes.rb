Rails.application.routes.draw do
  resources :comics do
    resources :pages
    resources :elements
  end

  root "comics#index"
end
