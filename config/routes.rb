Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: 'homes#top'
  get 'home/about' => 'homes#show'
  devise_for :users, controllers: {registrations: 'users/registrations',
  
  sessions: 'users/sessions' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  
end
