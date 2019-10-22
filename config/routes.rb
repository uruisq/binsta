Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :favindex
    end
  end
  resources :sessions
  root to: 'users#new'
  get '*path', to: 'application#error_404'
end
