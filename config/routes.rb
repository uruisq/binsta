Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :sessions
  root to: 'users#new'
  get '*path', to: 'application#error_404'
end
