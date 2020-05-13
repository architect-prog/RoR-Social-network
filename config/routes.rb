Rails.application.routes.draw do 

   root to: 'application#index'
   get '/users', to: 'users#all'    

   devise_for :users, controllers: { registrations: 'users/registrations' }

   resources :users, only: [:show, :destroy] do 
      member do
         get :following, :followers
      end   
      resources :posts
   end
  
   resources :relationships, only: [:create, :destroy]
   
   
end
