Rails.application.routes.draw do

  resources :projects
  resources :tasks
  resources :time_entries

  get :sign_in, to: 'sessions#new'
  get :sign_out, to: 'sessions#destroy'
  get :sign_up, to: 'registrations#new'
  get :forgot_password, to: 'passwords#new'

  resources :sessions, only: [:create]
  resources :passwords, only: [:edit, :create, :update]
  resources :registrations, only: [:create] do
    get :confirm, on: :collection
  end

  root to: 'time_entries#index'

end
