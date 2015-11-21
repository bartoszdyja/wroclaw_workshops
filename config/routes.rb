Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end

  resources :visitors, only: :index
end
