Rails.application.routes.draw do
  scope module: :public do
    root 'pages#main'
  end
end
