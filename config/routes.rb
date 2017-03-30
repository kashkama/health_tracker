Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :users do
    resources :foods
  end

  resources :users do
    resources :exercises
  end

  post '/users/:user_id/foods/:id/add' => 'foods#add', as: 'add_user_food'
end
