Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#show'
  devise_for :users
  #, controllers: {
   # sessions: 'users/sessions',
    #registrations: 'users/registrations'
 #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :create, :update]

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

end
