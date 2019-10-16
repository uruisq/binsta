Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions
  resources :favorites, only: [:create, :destroy]
  root to: 'users#new'
  get '*path', to: 'application#error_404'
end
