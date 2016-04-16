Rails.application.routes.draw do

  
  
  # app/config/routes.rb
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :categories
  resources :flashes
  resources :pictures
  get 'picture/picture'

  get 'picture/game'

  resources :comments

  resources :searches
  resources :infos
  put "voices/:increase_id" => "voices#increase", :as => "voices_increase"
  put "voices/:decrease_id" => "voices#decrease", :as => "voices_decrease"

  namespace :admin do
    resources  :admins
    resources  :configurables
    resources  :clients
    resources  :tasks
  end
  
  get 'admins/index'
    
  resources :searches do 
    collection do
      post "search_film" => "searches#search_film"
    end
  end



  
  get 'home/index'

  get 'store/index'
  get 'store/all_category'
  get 'store/show'
  get 'store/contact'
  get 'line/increase',to: 'line_items#increase', as: :increase_line_item
  get 'line/decrease',to: 'line_items#decrease', as: :decrease_line_item
  get 'store/showlike'
  get '/change_locale/:locale', to: 'pages#change_locale', as: :change_locale
  



  
 
 
  

  #devise_for :admins do
    #collection do
    #end
  #end
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  




 resources :films do
 
    collection do
      get "search" => "films#search"
    end  
    member do  
      get "play_game" => "films#play_game"
    end
  end





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#all_film'

end
