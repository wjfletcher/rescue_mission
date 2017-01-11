Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    resources :answers, only: [:create, :update]
  end
end
