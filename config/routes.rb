Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#show'
  devise_for :users
  #, controllers: {
  get 'search' => 'searches#search'
   # sessions: 'users/sessions',
    #registrations: 'users/registrations'
 #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :create, :update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


end
