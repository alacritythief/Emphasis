Rails.application.routes.draw do
  resources :comics do
    resources :pages do
      resources :elements
    end
  end

  root "comics#index"
end
