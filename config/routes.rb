Rails.application.routes.draw do
  root 'homes#index'
  get 'home/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :themes
  resources :gbangbans, only: [:index, :show, :new] do
    resources :commentaires, only: [:create, :destroy], shallow: true
  end
end
