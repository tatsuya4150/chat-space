Rails.application.routes.draw do
  devise_for :users
  root 'chat_groups#index'
  resources :chat_groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
end
