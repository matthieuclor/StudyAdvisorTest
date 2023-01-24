Rails.application.routes.draw do
  scope module: :public do
    root 'pages#main'
  end

  devise_for :users, controllers: {
    sessions: 'user_account/authentification/sessions',
    registrations: 'user_account/authentification/registrations',
    passwords: 'user_account/authentification/passwords',
  }

  namespace :user_account do
    resources :dashboards, only: :index
  end
end
