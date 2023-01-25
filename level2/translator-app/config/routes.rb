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
    resources :messages, only: %i(index show create)

    resources :tags, param: :name, only: %i() do
      scope module: :tags do
        resources :messages, only: :index
      end
    end
  end
end
