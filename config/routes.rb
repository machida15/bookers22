Rails.application.routes.draw do
  
  get 'searchs/search'
  
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
  resource :relationships, only:[:create, :destroy]
    get 'follower' => 'relationships#follower', as: 'follower'
    get 'followed' => 'relationships#followed', as: 'followed'
  end

  resources :books do
  #resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  get 'search' => 'searchs#search', as: 'search'

end