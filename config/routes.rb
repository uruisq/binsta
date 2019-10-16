Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions
  root to: 'users#new'
  get '*path', to: 'application#error_404'
end
